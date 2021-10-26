import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import { NodejsFunction } from '@aws-cdk/aws-lambda-nodejs';
import * as apigateway from '@aws-cdk/aws-apigateway';
import * as path from 'path';

// Schemas
import * as transformRequestSchema from './TransformRequest.schema.json';
import * as velocityTemplateRequestSchema from './VelocityTemplateRequest.schema.json';

export class TransformerStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const transformerFunc = new NodejsFunction(this, 'TransformerFunction', {
      memorySize: 1024,
      timeout: cdk.Duration.seconds(5),
      runtime: lambda.Runtime.NODEJS_14_X,
      entry: path.join(__dirname, '../lambda/transformer.ts'),
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
      description: 'GraphQL AppSync transformer',
      deployOptions: {
        stageName: 'dev',
      },

      defaultCorsPreflightOptions: {
        allowOrigins: [ '*' ],
        allowMethods: [ 'OPTIONS', 'POST' ],
      },
    })

    const graphqlModel = transformerApi.addModel('TransformRequest', {
      schema: JSON.parse(JSON.stringify(transformRequestSchema)),
    })

    const graphqlTransformer = transformerApi.root.addResource('graphql')

    graphqlTransformer.addMethod(
      'POST',
      new apigateway.LambdaIntegration(transformerFunc),
      {
        requestModels: {
          'application/json': graphqlModel,
        },
      }
    )

    const velocityFunc = new NodejsFunction(this, 'VelocityTemplateFunction', {
      memorySize: 1024,
      timeout: cdk.Duration.seconds(5),
      runtime: lambda.Runtime.NODEJS_14_X,
      entry: path.join(__dirname, '../lambda/velocity-template.ts'),
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

    const velocityModel = transformerApi.addModel('VelocityTemplateRequest', {
      schema: JSON.parse(JSON.stringify(velocityTemplateRequestSchema)),
    })

    const velocityTransformer = transformerApi.root.addResource('vtl')

    velocityTransformer.addMethod(
      'POST',
      new apigateway.LambdaIntegration(velocityFunc),
      {
        requestModels: {
          'application/json': velocityModel,
        },
      }
    )
  }
}
