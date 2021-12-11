import { ModelAuthTransformerConfig } from "graphql-auth-transformer";
import { DynamoDBModelTransformerOptions } from "graphql-dynamodb-transformer";
import { DeploymentResources } from "graphql-transformer-core";
import { AmplifyAppSyncSimulatorAuthenticationType } from 'amplify-appsync-simulator';
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
