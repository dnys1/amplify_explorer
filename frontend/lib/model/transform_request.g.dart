// To parse this JSON data, do
//
//     final transformRequest = transformRequestFromJson(jsonString);

import 'dart:convert';

TransformRequest transformRequestFromJson(String str) => TransformRequest.fromJson(json.decode(str));

String transformRequestToJson(TransformRequest data) => json.encode(data.toJson());

class TransformRequest {
    TransformRequest({
         this.authOptions,
         this.modelOptions,
         this.schema,
    });

    AuthOptions? authOptions;
    DynamoDbModelTransformerOptions? modelOptions;
    String? schema;

    factory TransformRequest.fromJson(Map<String, dynamic> json) => TransformRequest(
        authOptions: 
        json['authOptions'] == null ? null :
        AuthOptions.fromJson(json['authOptions']),
        modelOptions: 
        json['modelOptions'] == null ? null :
        DynamoDbModelTransformerOptions.fromJson(json['modelOptions']),
        schema: 
        json['schema'] == null ? null :
        json['schema'],
    );

    Map<String, dynamic> toJson() => {
        if (authOptions != null)
        'authOptions': authOptions?.toJson(),
        if (modelOptions != null)
        'modelOptions': modelOptions?.toJson(),
        if (schema != null)
        'schema': schema,
    };
}

class AuthOptions {
    AuthOptions({
         this.addAwsIamAuthInOutputSchema,
         this.authConfig,
    });

    bool? addAwsIamAuthInOutputSchema;
    AuthConfig? authConfig;

    factory AuthOptions.fromJson(Map<String, dynamic> json) => AuthOptions(
        addAwsIamAuthInOutputSchema: 
        json['addAwsIamAuthInOutputSchema'] == null ? null :
        json['addAwsIamAuthInOutputSchema'],
        authConfig: 
        json['authConfig'] == null ? null :
        AuthConfig.fromJson(json['authConfig']),
    );

    Map<String, dynamic> toJson() => {
        if (addAwsIamAuthInOutputSchema != null)
        'addAwsIamAuthInOutputSchema': addAwsIamAuthInOutputSchema,
        if (authConfig != null)
        'authConfig': authConfig?.toJson(),
    };
}

class AuthConfig {
    AuthConfig({
         this.additionalAuthenticationProviders,
         this.defaultAuthentication,
    });

    List<AdditionalAuthenticationProvider>? additionalAuthenticationProviders;
    DefaultAuthentication? defaultAuthentication;

    factory AuthConfig.fromJson(Map<String, dynamic> json) => AuthConfig(
        additionalAuthenticationProviders: 
        json['additionalAuthenticationProviders'] == null ? null :
        List<AdditionalAuthenticationProvider>.from(json['additionalAuthenticationProviders'].map((x) => AdditionalAuthenticationProvider.fromJson(x))),
        defaultAuthentication: 
        json['defaultAuthentication'] == null ? null :
        DefaultAuthentication.fromJson(json['defaultAuthentication']),
    );

    Map<String, dynamic> toJson() => {
        if (additionalAuthenticationProviders != null)
        'additionalAuthenticationProviders': List<dynamic>.from(additionalAuthenticationProviders!.map((x) => x.toJson())),
        if (defaultAuthentication != null)
        'defaultAuthentication': defaultAuthentication?.toJson(),
    };
}

class AdditionalAuthenticationProvider {
    AdditionalAuthenticationProvider({
         this.apiKeyConfig,
         this.authenticationType,
         this.openIdConnectConfig,
         this.userPoolConfig,
    });

    AdditionalAuthenticationProviderApiKeyConfig? apiKeyConfig;
    AppSyncAuthMode? authenticationType;
    AdditionalAuthenticationProviderOpenIdConnectConfig? openIdConnectConfig;
    AdditionalAuthenticationProviderUserPoolConfig? userPoolConfig;

    factory AdditionalAuthenticationProvider.fromJson(Map<String, dynamic> json) => AdditionalAuthenticationProvider(
        apiKeyConfig: 
        json['apiKeyConfig'] == null ? null :
        AdditionalAuthenticationProviderApiKeyConfig.fromJson(json['apiKeyConfig']),
        authenticationType: 
        json['authenticationType'] == null ? null :
        appSyncAuthModeValues.map[json['authenticationType']],
        openIdConnectConfig: 
        json['openIDConnectConfig'] == null ? null :
        AdditionalAuthenticationProviderOpenIdConnectConfig.fromJson(json['openIDConnectConfig']),
        userPoolConfig: 
        json['userPoolConfig'] == null ? null :
        AdditionalAuthenticationProviderUserPoolConfig.fromJson(json['userPoolConfig']),
    );

    Map<String, dynamic> toJson() => {
        if (apiKeyConfig != null)
        'apiKeyConfig': apiKeyConfig?.toJson(),
        if (authenticationType != null)
        'authenticationType': appSyncAuthModeValues.reverse[authenticationType],
        if (openIdConnectConfig != null)
        'openIDConnectConfig': openIdConnectConfig?.toJson(),
        if (userPoolConfig != null)
        'userPoolConfig': userPoolConfig?.toJson(),
    };
}

class AdditionalAuthenticationProviderApiKeyConfig {
    AdditionalAuthenticationProviderApiKeyConfig({
         this.apiKeyExpirationDays,
         this.description,
    });

    double? apiKeyExpirationDays;
    String? description;

    factory AdditionalAuthenticationProviderApiKeyConfig.fromJson(Map<String, dynamic> json) => AdditionalAuthenticationProviderApiKeyConfig(
        apiKeyExpirationDays: 
        json['apiKeyExpirationDays'] == null ? null :
        json['apiKeyExpirationDays'].toDouble(),
        description: 
        json['description'] == null ? null :
        json['description'],
    );

    Map<String, dynamic> toJson() => {
        if (apiKeyExpirationDays != null)
        'apiKeyExpirationDays': apiKeyExpirationDays,
        if (description != null)
        'description': description,
    };
}

enum AppSyncAuthMode { AMAZON_COGNITO_USER_POOLS, API_KEY, AWS_IAM, OPENID_CONNECT }

final appSyncAuthModeValues = EnumValues({
    "AMAZON_COGNITO_USER_POOLS": AppSyncAuthMode.AMAZON_COGNITO_USER_POOLS,
    "API_KEY": AppSyncAuthMode.API_KEY,
    "AWS_IAM": AppSyncAuthMode.AWS_IAM,
    "OPENID_CONNECT": AppSyncAuthMode.OPENID_CONNECT
});

class AdditionalAuthenticationProviderOpenIdConnectConfig {
    AdditionalAuthenticationProviderOpenIdConnectConfig({
         this.authTtl,
         this.clientId,
         this.iatTtl,
         this.issuerUrl,
         this.name,
    });

    double? authTtl;
    String? clientId;
    double? iatTtl;
    String? issuerUrl;
    String? name;

    factory AdditionalAuthenticationProviderOpenIdConnectConfig.fromJson(Map<String, dynamic> json) => AdditionalAuthenticationProviderOpenIdConnectConfig(
        authTtl: 
        json['authTTL'] == null ? null :
        json['authTTL'].toDouble(),
        clientId: 
        json['clientId'] == null ? null :
        json['clientId'],
        iatTtl: 
        json['iatTTL'] == null ? null :
        json['iatTTL'].toDouble(),
        issuerUrl: 
        json['issuerUrl'] == null ? null :
        json['issuerUrl'],
        name: 
        json['name'] == null ? null :
        json['name'],
    );

    Map<String, dynamic> toJson() => {
        if (authTtl != null)
        'authTTL': authTtl,
        if (clientId != null)
        'clientId': clientId,
        if (iatTtl != null)
        'iatTTL': iatTtl,
        if (issuerUrl != null)
        'issuerUrl': issuerUrl,
        if (name != null)
        'name': name,
    };
}

class AdditionalAuthenticationProviderUserPoolConfig {
    AdditionalAuthenticationProviderUserPoolConfig({
         this.userPoolId,
    });

    String? userPoolId;

    factory AdditionalAuthenticationProviderUserPoolConfig.fromJson(Map<String, dynamic> json) => AdditionalAuthenticationProviderUserPoolConfig(
        userPoolId: 
        json['userPoolId'] == null ? null :
        json['userPoolId'],
    );

    Map<String, dynamic> toJson() => {
        if (userPoolId != null)
        'userPoolId': userPoolId,
    };
}

class DefaultAuthentication {
    DefaultAuthentication({
         this.apiKeyConfig,
         this.authenticationType,
         this.openIdConnectConfig,
         this.userPoolConfig,
    });

    DefaultAuthenticationApiKeyConfig? apiKeyConfig;
    AppSyncAuthMode? authenticationType;
    DefaultAuthenticationOpenIdConnectConfig? openIdConnectConfig;
    DefaultAuthenticationUserPoolConfig? userPoolConfig;

    factory DefaultAuthentication.fromJson(Map<String, dynamic> json) => DefaultAuthentication(
        apiKeyConfig: 
        json['apiKeyConfig'] == null ? null :
        DefaultAuthenticationApiKeyConfig.fromJson(json['apiKeyConfig']),
        authenticationType: 
        json['authenticationType'] == null ? null :
        appSyncAuthModeValues.map[json['authenticationType']],
        openIdConnectConfig: 
        json['openIDConnectConfig'] == null ? null :
        DefaultAuthenticationOpenIdConnectConfig.fromJson(json['openIDConnectConfig']),
        userPoolConfig: 
        json['userPoolConfig'] == null ? null :
        DefaultAuthenticationUserPoolConfig.fromJson(json['userPoolConfig']),
    );

    Map<String, dynamic> toJson() => {
        if (apiKeyConfig != null)
        'apiKeyConfig': apiKeyConfig?.toJson(),
        if (authenticationType != null)
        'authenticationType': appSyncAuthModeValues.reverse[authenticationType],
        if (openIdConnectConfig != null)
        'openIDConnectConfig': openIdConnectConfig?.toJson(),
        if (userPoolConfig != null)
        'userPoolConfig': userPoolConfig?.toJson(),
    };
}

class DefaultAuthenticationApiKeyConfig {
    DefaultAuthenticationApiKeyConfig({
         this.apiKeyExpirationDays,
         this.description,
    });

    double? apiKeyExpirationDays;
    String? description;

    factory DefaultAuthenticationApiKeyConfig.fromJson(Map<String, dynamic> json) => DefaultAuthenticationApiKeyConfig(
        apiKeyExpirationDays: 
        json['apiKeyExpirationDays'] == null ? null :
        json['apiKeyExpirationDays'].toDouble(),
        description: 
        json['description'] == null ? null :
        json['description'],
    );

    Map<String, dynamic> toJson() => {
        if (apiKeyExpirationDays != null)
        'apiKeyExpirationDays': apiKeyExpirationDays,
        if (description != null)
        'description': description,
    };
}

class DefaultAuthenticationOpenIdConnectConfig {
    DefaultAuthenticationOpenIdConnectConfig({
         this.authTtl,
         this.clientId,
         this.iatTtl,
         this.issuerUrl,
         this.name,
    });

    double? authTtl;
    String? clientId;
    double? iatTtl;
    String? issuerUrl;
    String? name;

    factory DefaultAuthenticationOpenIdConnectConfig.fromJson(Map<String, dynamic> json) => DefaultAuthenticationOpenIdConnectConfig(
        authTtl: 
        json['authTTL'] == null ? null :
        json['authTTL'].toDouble(),
        clientId: 
        json['clientId'] == null ? null :
        json['clientId'],
        iatTtl: 
        json['iatTTL'] == null ? null :
        json['iatTTL'].toDouble(),
        issuerUrl: 
        json['issuerUrl'] == null ? null :
        json['issuerUrl'],
        name: 
        json['name'] == null ? null :
        json['name'],
    );

    Map<String, dynamic> toJson() => {
        if (authTtl != null)
        'authTTL': authTtl,
        if (clientId != null)
        'clientId': clientId,
        if (iatTtl != null)
        'iatTTL': iatTtl,
        if (issuerUrl != null)
        'issuerUrl': issuerUrl,
        if (name != null)
        'name': name,
    };
}

class DefaultAuthenticationUserPoolConfig {
    DefaultAuthenticationUserPoolConfig({
         this.userPoolId,
    });

    String? userPoolId;

    factory DefaultAuthenticationUserPoolConfig.fromJson(Map<String, dynamic> json) => DefaultAuthenticationUserPoolConfig(
        userPoolId: 
        json['userPoolId'] == null ? null :
        json['userPoolId'],
    );

    Map<String, dynamic> toJson() => {
        if (userPoolId != null)
        'userPoolId': userPoolId,
    };
}

class DynamoDbModelTransformerOptions {
    DynamoDbModelTransformerOptions({
         this.enableDeletionProtection,
         this.syncConfig,
    });

    bool? enableDeletionProtection;
    SyncConfig? syncConfig;

    factory DynamoDbModelTransformerOptions.fromJson(Map<String, dynamic> json) => DynamoDbModelTransformerOptions(
        enableDeletionProtection: 
        json['EnableDeletionProtection'] == null ? null :
        json['EnableDeletionProtection'],
        syncConfig: 
        json['SyncConfig'] == null ? null :
        SyncConfig.fromJson(json['SyncConfig']),
    );

    Map<String, dynamic> toJson() => {
        if (enableDeletionProtection != null)
        'EnableDeletionProtection': enableDeletionProtection,
        if (syncConfig != null)
        'SyncConfig': syncConfig?.toJson(),
    };
}

class SyncConfig {
    SyncConfig({
         this.conflictDetection,
         this.conflictHandler,
         this.lambdaConflictHandler,
    });

    ConflictDetectionType? conflictDetection;
    ConflictHandler? conflictHandler;
    LambdaConflictHandler? lambdaConflictHandler;

    factory SyncConfig.fromJson(Map<String, dynamic> json) => SyncConfig(
        conflictDetection: 
        json['ConflictDetection'] == null ? null :
        conflictDetectionTypeValues.map[json['ConflictDetection']],
        conflictHandler: 
        json['ConflictHandler'] == null ? null :
        conflictHandlerValues.map[json['ConflictHandler']],
        lambdaConflictHandler: 
        json['LambdaConflictHandler'] == null ? null :
        LambdaConflictHandler.fromJson(json['LambdaConflictHandler']),
    );

    Map<String, dynamic> toJson() => {
        if (conflictDetection != null)
        'ConflictDetection': conflictDetectionTypeValues.reverse[conflictDetection],
        if (conflictHandler != null)
        'ConflictHandler': conflictHandlerValues.reverse[conflictHandler],
        if (lambdaConflictHandler != null)
        'LambdaConflictHandler': lambdaConflictHandler?.toJson(),
    };
}

enum ConflictDetectionType { NONE, VERSION }

final conflictDetectionTypeValues = EnumValues({
    "NONE": ConflictDetectionType.NONE,
    "VERSION": ConflictDetectionType.VERSION
});

enum ConflictHandler { OPTIMISTIC_CONCURRENCY, AUTOMERGE, LAMBDA }

final conflictHandlerValues = EnumValues({
    "AUTOMERGE": ConflictHandler.AUTOMERGE,
    "LAMBDA": ConflictHandler.LAMBDA,
    "OPTIMISTIC_CONCURRENCY": ConflictHandler.OPTIMISTIC_CONCURRENCY
});

class LambdaConflictHandler {
    LambdaConflictHandler({
        required this.lambdaArn,
         this.name,
         this.region,
    });

    dynamic lambdaArn;
    String? name;
    String? region;

    factory LambdaConflictHandler.fromJson(Map<String, dynamic> json) => LambdaConflictHandler(
        lambdaArn: 
        json['lambdaArn'],
        name: 
        json['name'] == null ? null :
        json['name'],
        region: 
        json['region'] == null ? null :
        json['region'],
    );

    Map<String, dynamic> toJson() => {
        'lambdaArn': lambdaArn,
        if (name != null)
        'name': name,
        if (region != null)
        'region': region,
    };
}

class EnumValues<T> {
        Map<String, T> map;
        Map<T, String>? reverseMap;

        EnumValues(this.map);

        Map<T, String> get reverse {
            return reverseMap ??= map.map((k, v) => MapEntry(v, k));
        }
    }
