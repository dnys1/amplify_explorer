import { ModelAuthTransformerConfig } from "graphql-auth-transformer";
import { DynamoDBModelTransformerOptions } from "graphql-dynamodb-transformer";
import { DeploymentResources } from "graphql-transformer-core";
import { AppSyncVTLRenderContext } from 'amplify-appsync-simulator/lib/velocity';
// import { AppSyncGraphQLExecutionContext } from 'amplify-appsync-simulator/lib/utils/graphql-runner';
import { AmplifyAppSyncAPIConfig, AmplifyAppSyncSimulatorAuthenticationType, AmplifyAppSyncSimulatorConfig } from 'amplify-appsync-simulator';
import { GraphQLResolveInfo, FieldNode } from 'graphql';
import { JWTToken } from "amplify-appsync-simulator/lib/utils/auth-helpers/helpers";

export interface TransformRequest {
    authOptions?: ModelAuthTransformerConfig,
    modelOptions?: DynamoDBModelTransformerOptions,
    schema: string,
} 

export type TransformResponse = DeploymentResources;

export type AppSyncGraphQLExecutionContext = {
    jwt?: JWTToken;
    sourceIp?: string;
    headers: {
        [key: string]: string;
    };
    requestAuthorizationMode: AmplifyAppSyncSimulatorAuthenticationType;
}

export type VelocityTemplateRequest = {
    templateName: string;
    template: string;
    schema: string;
    appSyncConfig: AmplifyAppSyncAPIConfig;
    renderContext: AppSyncVTLRenderContext;
    executionContext: AppSyncGraphQLExecutionContext;
    graphQLRequest: {
        query: string;
        operationName: string;
        variables?: { [key: string]: any };
    }
}

export type VelocityTemplateResponse = {
    result: Record<string, any>;
    stash: Record<string, any>;
    errors: any[]; 
    isReturn: boolean; 
    hadException: boolean;
}
