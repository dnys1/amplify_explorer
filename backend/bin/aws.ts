#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { TransformerStack } from '../lib/transformer-stack';

const app = new cdk.App();
new TransformerStack(app, 'TransformerStack', {
  env: {
    account: process.env.AWS_ACCOUNT_ID,
    region: process.env.AWS_REGION,
  },
});
