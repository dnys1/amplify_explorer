import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import { NodejsFunction } from '@aws-cdk/aws-lambda-nodejs';
import * as apigateway from '@aws-cdk/aws-apigateway';
import * as path from 'path';

// Schemas
import * as v1RequestSchema from './v1/TransformRequest.schema.json';
import * as v2RequestSchema from './v2/TransformRequest.schema.json';

export class TransformerStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const transformerV1Func = new NodejsFunction(this, 'TransformerV1Function', {
      memorySize: 1024,
      timeout: cdk.Duration.seconds(5),
      runtime: lambda.Runtime.NODEJS_14_X,
      entry: path.join(__dirname, '../lambda/v1/transformer.ts'),
      projectRoot: path.join(__dirname, '../lambda'),
      depsLockFilePath: path.join(__dirname, '../lambda/yarn.lock'),
      handler: 'handler',
      bundling: {
        externalModules: [ 'aws-sdk' ],

        // This package does not like to be bundled
        nodeModules: [ 'vm2' ],
      },
      environment: {
        // Fixes attempt to create a log file in a read-only FS
        'AMPLIFY_CLI_DISABLE_LOGGING': 'true',
      }
    })

    const transformerApi = new apigateway.RestApi(this, 'TransformerApi', {
      description: 'Amplify GraphQL Transformer',
      deployOptions: {
        stageName: 'dev',
      },

      defaultCorsPreflightOptions: {
        allowOrigins: [ '*' ],
        allowMethods: [ 'OPTIONS', 'POST' ],
      },
    })

    const v1Model = transformerApi.addModel('TransformerV1Request', {
      schema: JSON.parse(JSON.stringify(v1RequestSchema)),
    })

    const graphqlTransformerV1 = transformerApi.root.addResource('v1')

    graphqlTransformerV1.addMethod(
      'POST',
      new apigateway.LambdaIntegration(transformerV1Func),
      {
        requestModels: {
          'application/json': v1Model,
        },
      }
    )

    const transformerV2Func = new NodejsFunction(this, 'TransformerV2Function', {
      memorySize: 1024,
      timeout: cdk.Duration.seconds(5),
      runtime: lambda.Runtime.NODEJS_14_X,
      entry: path.join(__dirname, '../lambda/v2/transformer.ts'),
      projectRoot: path.join(__dirname, '../lambda'),
      depsLockFilePath: path.join(__dirname, '../lambda/yarn.lock'),
      handler: 'handler',
      bundling: {
        externalModules: [ 'aws-sdk' ],

        // This package does not like to be bundled
        nodeModules: [ 'vm2' ],
      },
      environment: {
        // Fixes attempt to create a log file in a read-only FS
        'AMPLIFY_CLI_DISABLE_LOGGING': 'true',
      }
    })

    const v2Model = transformerApi.addModel('TransformerV2Request', {
      schema: JSON.parse(JSON.stringify(v2RequestSchema)),
    })

    const graphqlTransformerV2 = transformerApi.root.addResource('v2')

    graphqlTransformerV2.addMethod(
      'POST',
      new apigateway.LambdaIntegration(transformerV2Func),
      {
        requestModels: {
          'application/json': v2Model,
        },
      }
    )
  }
}
