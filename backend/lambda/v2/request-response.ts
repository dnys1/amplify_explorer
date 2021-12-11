import { AuthTransformerConfig } from "@aws-amplify/graphql-auth-transformer";
import { PredictionsConfig } from "@aws-amplify/graphql-predictions-transformer/lib/graphql-predictions-transformer";
import { SyncConfig } from "@aws-amplify/graphql-transformer-core";
import { DeploymentResources } from "@aws-amplify/graphql-transformer-core";

type ModelTransformerOptions = {
    EnableDeletionProtection?: boolean;
    SyncConfig?: SyncConfig;
};

export interface TransformRequest {
    authOptions?: AuthTransformerConfig,
    modelOptions?: ModelTransformerOptions,
    predictionsOptions?: PredictionsConfig,
    schema: string,
} 

export type TransformResponse = DeploymentResources;
