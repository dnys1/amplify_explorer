import { VelocityTemplate, AppSyncVTLRenderContext } from 'amplify-appsync-simulator/lib/velocity';
import { AppSyncGraphQLExecutionContext } from 'amplify-appsync-simulator/lib/utils/graphql-runner';
import { AmplifyAppSyncSimulator, AmplifyAppSyncAPIConfig } from 'amplify-appsync-simulator';
import { parse, execute,  GraphQLResolveInfo, GraphQLObjectType, ObjectTypeDefinitionNode, OperationDefinitionNode } from 'graphql';
import { buildResolveInfo, collectFields } from 'graphql/execution/execute';
import {
    APIGatewayProxyEventV2,
    APIGatewayProxyResultV2,
} from 'aws-lambda';
import { VelocityTemplateRequest } from './request-response';
import { corsHeaders } from './common';

export const handler = async (
    event: APIGatewayProxyEventV2
): Promise<APIGatewayProxyResultV2> => {
    const requestJSON = event.body
    if (requestJSON === undefined || requestJSON === null) {
        return {
            statusCode: 400,
            body: 'Empty request',
            headers: corsHeaders,
        }
    }
    try {
        const request: VelocityTemplateRequest = JSON.parse(requestJSON)
        const simulator = new AmplifyAppSyncSimulator()
        simulator.init({
            schema: {
                content: request.schema,
            },
            appSync: request.appSyncConfig,
        })

        const { query } = request.graphQLRequest
        const operationDoc = parse(query).definitions.find((node) => node.kind == 'OperationDefinition') as OperationDefinitionNode

        const schema = simulator.schema;
        const typeName = request.templateName.split('.')
        
        const operationType = typeName[0].toLowerCase()
        const fieldName = typeName[1]
        
        const parentType = simulator.schema.getType(typeName[0]) as GraphQLObjectType
        const field = parentType.getFields()[fieldName]!
        const info: GraphQLResolveInfo = {
            fieldName: fieldName,
            fieldNodes: [ ],
            parentType: parentType,
            returnType: field.type,
            path: {
                prev: {
                    prev: undefined,
                    key: operationType,
                },
                key: fieldName,
            },
            schema: schema,
            fragments: {},
            rootValue: simulator.schema,
            operation: operationDoc,
            variableValues: {},
        }
        const template = new VelocityTemplate({ content: request.template }, simulator);
        const rendered = template.render(
            request.renderContext,
            request.executionContext,
            info,
        )
        return {
            statusCode: 200,
            headers: corsHeaders,
            body: JSON.stringify(rendered),
        }
    } catch (e: any) {
        console.error(`Error rendering template: ${e}`)
        console.error(`Stack ${e.stack}`)
        return {
            statusCode: 500,
            headers: corsHeaders,
            body: `Error rendering template: ${e}`,
        }
    }
}
