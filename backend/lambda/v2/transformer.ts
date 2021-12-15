import { AuthTransformer } from "@aws-amplify/graphql-auth-transformer"
import { FunctionTransformer } from "@aws-amplify/graphql-function-transformer"
import { HttpTransformer } from "@aws-amplify/graphql-http-transformer"
import { IndexTransformer } from "@aws-amplify/graphql-index-transformer"
import { ModelTransformer } from "@aws-amplify/graphql-model-transformer"
import { PredictionsTransformer } from "@aws-amplify/graphql-predictions-transformer"
import { BelongsToTransformer, HasManyTransformer, HasOneTransformer, ManyToManyTransformer } from "@aws-amplify/graphql-relational-transformer"
import { SearchableModelTransformer } from "@aws-amplify/graphql-searchable-transformer"
import { GraphQLTransform } from "@aws-amplify/graphql-transformer-core"
import { APIGatewayProxyEventV2, APIGatewayProxyResultV2 } from "aws-lambda"
import { corsHeaders } from "../common"
import { FeatureFlags } from "./flags"
import { TransformRequest } from "./request-response"

export const handler = async (
    event: APIGatewayProxyEventV2
): Promise<APIGatewayProxyResultV2> => {
    const requestJSON = event.body;
    if (requestJSON === undefined || requestJSON === null) {
        return {
            statusCode: 400,
            body: 'Empty request',
            headers: corsHeaders,
        };
    }
    const request: TransformRequest = JSON.parse(requestJSON);

    const modelTransformer = new ModelTransformer(request.modelOptions);
    const authTransformer = new AuthTransformer(request.authOptions);
    const indexTransformer = new IndexTransformer();
    const hasOneTransformer = new HasOneTransformer();
    const transformer = new GraphQLTransform({
        transformers: [
            modelTransformer,
            authTransformer,
            indexTransformer,
            hasOneTransformer,
            new HasManyTransformer(),
            new BelongsToTransformer(),
            new ManyToManyTransformer(modelTransformer, indexTransformer, hasOneTransformer, authTransformer),
            new FunctionTransformer(),
            new HttpTransformer(),
            new PredictionsTransformer(request.predictionsOptions),
            new SearchableModelTransformer(),
        ],
        featureFlags: new FeatureFlags(),
    });
    try {
        const cfdoc = transformer.transform(request.schema);
        return {
            statusCode: 200,
            body: JSON.stringify(cfdoc),
            headers: corsHeaders,
        };
    } catch (e: any) {
        console.error(`Error transforming schema: ${e}`);
        console.error(`Stack ${e.stack}`);
        return {
            statusCode: 500,
            body: `Error transforming schema: ${e}`,
            headers: corsHeaders,
        };
    }
};
