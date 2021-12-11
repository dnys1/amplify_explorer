import { FeatureFlagProvider } from '@aws-amplify/graphql-transformer-interfaces';

const features: {
    [record: string]: any
} = {
    "addmissingownerfields": true,
    "improvepluralization": true,
    "validatetypenamereservedwords": true,
    "useexperimentalpipelinedtransformer": false,
    "enableiterativegsiupdates": true,
    "secondarykeyasgsi": true,
    "skipoverridemutationinputtypes": true
}

export class FeatureFlags implements FeatureFlagProvider {
    getBoolean(featureName: string, defaultValue?: boolean | null): boolean {
        const value = features[featureName.toLowerCase()] ?? defaultValue
        if (value === null || value === undefined) {
            throw `No value for ${featureName}`
        }
        return value
    }
    getString(featureName: string, defaultValue?: string): string {
        const value = features[featureName.toLowerCase()] ?? defaultValue
        if (value === null || value === undefined) {
            throw `No value for ${featureName}`
        }
        return value
    }
    getNumber(featureName: string, defaultValue?: number): number {
        const value = features[featureName.toLowerCase()] ?? defaultValue
        if (value === null || value === undefined) {
            throw `No value for ${featureName}`
        }
        return value
    }
    getObject(featureName: string, defaultValue?: object): object {
        const value = features[featureName.toLowerCase()] ?? defaultValue
        if (value === null || value === undefined) {
            throw `No value for ${featureName}`
        }
        return value
    }
}
