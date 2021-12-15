import { DynamoDBModelTransformer, DynamoDBModelTransformerOptions } from 'graphql-dynamodb-transformer';
import { ModelAuthTransformer, ModelAuthTransformerConfig } from 'graphql-auth-transformer';
import { ModelConnectionTransformer } from 'graphql-connection-transformer';
import { PredictionsTransformer } from 'graphql-predictions-transformer';
// import { VersionedModelTransformer } from 'graphql-versioned-transformer';
import { KeyTransformer } from 'graphql-key-transformer';
import { SearchableModelTransformer } from 'graphql-elasticsearch-transformer';
import { FunctionTransformer } from 'graphql-function-transformer';
import { HttpTransformer } from 'graphql-http-transformer';
import { RelationalDBSchemaTransformer } from 'graphql-relational-schema-transformer';
import { ConflictHandlerType, GraphQLTransform } from 'graphql-transformer-core';
import {
    APIGatewayProxyEventV2,
    APIGatewayProxyResultV2,
} from 'aws-lambda';
import { TransformRequest } from './request-response';
import { FeatureFlags } from './flags';
import { corsHeaders } from '../common';

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
    const request: TransformRequest = JSON.parse(requestJSON)
    const transformer = new GraphQLTransform({
        transformers: [
            new DynamoDBModelTransformer(request.modelOptions),
            new ModelAuthTransformer(request.authOptions),
            new KeyTransformer(),
            new ModelConnectionTransformer(),
            // new PredictionsTransformer(),
            new SearchableModelTransformer(),
            // new VersionedModelTransformer(),
            // new FunctionTransformer(),
            new HttpTransformer(),
        ],
        featureFlags: new FeatureFlags(),
    })
    try {
        const cfdoc = transformer.transform(request.schema)
        return {
            statusCode: 200,
            body: JSON.stringify(cfdoc),
            headers: corsHeaders,
        }
    } catch (e: any) {
        console.error(`Error transforming schema: ${e}`)
        console.error(`Stack ${e.stack}`)
        return {
            statusCode: 500,
            body: `Error transforming schema: ${e}`,
            headers: corsHeaders,
        }
    }
}
