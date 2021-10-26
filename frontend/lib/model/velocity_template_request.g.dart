// To parse this JSON data, do
//
//     final velocityTemplateRequest = velocityTemplateRequestFromJson(jsonString);

import 'dart:convert';

VelocityTemplateRequest velocityTemplateRequestFromJson(String str) =>
    VelocityTemplateRequest.fromJson(json.decode(str));

String velocityTemplateRequestToJson(VelocityTemplateRequest data) =>
    json.encode(data.toJson());

class VelocityTemplateRequest {
  VelocityTemplateRequest({
    this.config,
    this.executionContext,
    this.renderContext,
    this.template,
  });

  VelocityTemplateRequestConfig? config;
  ExecutionContext? executionContext;
  RenderContext? renderContext;
  String? template;

  factory VelocityTemplateRequest.fromJson(Map<String, dynamic> json) =>
      VelocityTemplateRequest(
        config: json['config'] == null
            ? null
            : VelocityTemplateRequestConfig.fromJson(json['config']),
        executionContext: json['executionContext'] == null
            ? null
            : ExecutionContext.fromJson(json['executionContext']),
        renderContext: json['renderContext'] == null
            ? null
            : RenderContext.fromJson(json['renderContext']),
        template: json['template'] == null ? null : json['template'],
      );

  Map<String, dynamic> toJson() => {
        if (config != null) 'config': config?.toJson(),
        if (executionContext != null)
          'executionContext': executionContext?.toJson(),
        if (renderContext != null) 'renderContext': renderContext?.toJson(),
        if (template != null) 'template': template,
      };
}

class VelocityTemplateRequestConfig {
  VelocityTemplateRequestConfig({
    this.appSync,
    this.dataSources,
    this.functions,
    this.mappingTemplates,
    this.resolvers,
    this.schema,
    this.tables,
  });

  AppSync? appSync;
  List<AppSyncSimulatorDataSourceConfig>? dataSources;
  List<FunctionElement>? functions;
  List<MappingTemplate>? mappingTemplates;
  List<AppSyncSimulatorResolverConfig>? resolvers;
  Schema? schema;
  List<String>? tables;

  factory VelocityTemplateRequestConfig.fromJson(Map<String, dynamic> json) =>
      VelocityTemplateRequestConfig(
        appSync:
            json['appSync'] == null ? null : AppSync.fromJson(json['appSync']),
        dataSources: json['dataSources'] == null
            ? null
            : List<AppSyncSimulatorDataSourceConfig>.from(json['dataSources']
                .map((x) => AppSyncSimulatorDataSourceConfig.fromJson(x))),
        functions: json['functions'] == null
            ? null
            : List<FunctionElement>.from(
                json['functions'].map((x) => FunctionElement.fromJson(x))),
        mappingTemplates: json['mappingTemplates'] == null
            ? null
            : List<MappingTemplate>.from(json['mappingTemplates']
                .map((x) => MappingTemplate.fromJson(x))),
        resolvers: json['resolvers'] == null
            ? null
            : List<AppSyncSimulatorResolverConfig>.from(json['resolvers']
                .map((x) => AppSyncSimulatorResolverConfig.fromJson(x))),
        schema: json['schema'] == null ? null : Schema.fromJson(json['schema']),
        tables: json['tables'] == null
            ? null
            : List<String>.from(json['tables'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        if (appSync != null) 'appSync': appSync?.toJson(),
        if (dataSources != null)
          'dataSources':
              List<dynamic>.from(dataSources!.map((x) => x.toJson())),
        if (functions != null)
          'functions': List<dynamic>.from(functions!.map((x) => x.toJson())),
        if (mappingTemplates != null)
          'mappingTemplates':
              List<dynamic>.from(mappingTemplates!.map((x) => x.toJson())),
        if (resolvers != null)
          'resolvers': List<dynamic>.from(resolvers!.map((x) => x.toJson())),
        if (schema != null) 'schema': schema?.toJson(),
        if (tables != null) 'tables': List<dynamic>.from(tables!.map((x) => x)),
      };
}

class AppSync {
  AppSync({
    this.additionalAuthenticationProviders,
    this.apiKey,
    this.defaultAuthenticationType,
    this.name,
  });

  List<AdditionalAuthenticationProvider>? additionalAuthenticationProviders;
  String? apiKey;
  DefaultAuthenticationType? defaultAuthenticationType;
  String? name;

  factory AppSync.fromJson(Map<String, dynamic> json) => AppSync(
        additionalAuthenticationProviders:
            json['additionalAuthenticationProviders'] == null
                ? null
                : List<AdditionalAuthenticationProvider>.from(
                    json['additionalAuthenticationProviders'].map(
                        (x) => AdditionalAuthenticationProvider.fromJson(x))),
        apiKey: json['apiKey'] == null ? null : json['apiKey'],
        defaultAuthenticationType: json['defaultAuthenticationType'] == null
            ? null
            : DefaultAuthenticationType.fromJson(
                json['defaultAuthenticationType']),
        name: json['name'] == null ? null : json['name'],
      );

  Map<String, dynamic> toJson() => {
        if (additionalAuthenticationProviders != null)
          'additionalAuthenticationProviders': List<dynamic>.from(
              additionalAuthenticationProviders!.map((x) => x.toJson())),
        if (apiKey != null) 'apiKey': apiKey,
        if (defaultAuthenticationType != null)
          'defaultAuthenticationType': defaultAuthenticationType?.toJson(),
        if (name != null) 'name': name,
      };
}

class AdditionalAuthenticationProvider {
  AdditionalAuthenticationProvider({
    this.authenticationType,
    this.cognitoUserPoolConfig,
    this.openIdConnectConfig,
  });

  AmplifyAppSyncSimulatorAuthenticationType? authenticationType;
  AdditionalAuthenticationProviderCognitoUserPoolConfig? cognitoUserPoolConfig;
  AdditionalAuthenticationProviderOpenIdConnectConfig? openIdConnectConfig;

  factory AdditionalAuthenticationProvider.fromJson(
          Map<String, dynamic> json) =>
      AdditionalAuthenticationProvider(
        authenticationType: json['authenticationType'] == null
            ? null
            : amplifyAppSyncSimulatorAuthenticationTypeValues
                .map[json['authenticationType']],
        cognitoUserPoolConfig: json['cognitoUserPoolConfig'] == null
            ? null
            : AdditionalAuthenticationProviderCognitoUserPoolConfig.fromJson(
                json['cognitoUserPoolConfig']),
        openIdConnectConfig: json['openIDConnectConfig'] == null
            ? null
            : AdditionalAuthenticationProviderOpenIdConnectConfig.fromJson(
                json['openIDConnectConfig']),
      );

  Map<String, dynamic> toJson() => {
        if (authenticationType != null)
          'authenticationType': amplifyAppSyncSimulatorAuthenticationTypeValues
              .reverse[authenticationType],
        if (cognitoUserPoolConfig != null)
          'cognitoUserPoolConfig': cognitoUserPoolConfig?.toJson(),
        if (openIdConnectConfig != null)
          'openIDConnectConfig': openIdConnectConfig?.toJson(),
      };
}

enum AmplifyAppSyncSimulatorAuthenticationType {
  API_KEY,
  AWS_IAM,
  AMAZON_COGNITO_USER_POOLS,
  OPENID_CONNECT
}

final amplifyAppSyncSimulatorAuthenticationTypeValues = EnumValues({
  "AMAZON_COGNITO_USER_POOLS":
      AmplifyAppSyncSimulatorAuthenticationType.AMAZON_COGNITO_USER_POOLS,
  "API_KEY": AmplifyAppSyncSimulatorAuthenticationType.API_KEY,
  "AWS_IAM": AmplifyAppSyncSimulatorAuthenticationType.AWS_IAM,
  "OPENID_CONNECT": AmplifyAppSyncSimulatorAuthenticationType.OPENID_CONNECT
});

class AdditionalAuthenticationProviderCognitoUserPoolConfig {
  AdditionalAuthenticationProviderCognitoUserPoolConfig({
    this.appIdClientRegex,
  });

  String? appIdClientRegex;

  factory AdditionalAuthenticationProviderCognitoUserPoolConfig.fromJson(
          Map<String, dynamic> json) =>
      AdditionalAuthenticationProviderCognitoUserPoolConfig(
        appIdClientRegex:
            json['AppIdClientRegex'] == null ? null : json['AppIdClientRegex'],
      );

  Map<String, dynamic> toJson() => {
        if (appIdClientRegex != null) 'AppIdClientRegex': appIdClientRegex,
      };
}

class AdditionalAuthenticationProviderOpenIdConnectConfig {
  AdditionalAuthenticationProviderOpenIdConnectConfig({
    this.clientId,
    this.issuer,
  });

  String? clientId;
  String? issuer;

  factory AdditionalAuthenticationProviderOpenIdConnectConfig.fromJson(
          Map<String, dynamic> json) =>
      AdditionalAuthenticationProviderOpenIdConnectConfig(
        clientId: json['ClientId'] == null ? null : json['ClientId'],
        issuer: json['Issuer'] == null ? null : json['Issuer'],
      );

  Map<String, dynamic> toJson() => {
        if (clientId != null) 'ClientId': clientId,
        if (issuer != null) 'Issuer': issuer,
      };
}

class DefaultAuthenticationType {
  DefaultAuthenticationType({
    this.authenticationType,
    this.cognitoUserPoolConfig,
    this.openIdConnectConfig,
  });

  AmplifyAppSyncSimulatorAuthenticationType? authenticationType;
  DefaultAuthenticationTypeCognitoUserPoolConfig? cognitoUserPoolConfig;
  DefaultAuthenticationTypeOpenIdConnectConfig? openIdConnectConfig;

  factory DefaultAuthenticationType.fromJson(Map<String, dynamic> json) =>
      DefaultAuthenticationType(
        authenticationType: json['authenticationType'] == null
            ? null
            : amplifyAppSyncSimulatorAuthenticationTypeValues
                .map[json['authenticationType']],
        cognitoUserPoolConfig: json['cognitoUserPoolConfig'] == null
            ? null
            : DefaultAuthenticationTypeCognitoUserPoolConfig.fromJson(
                json['cognitoUserPoolConfig']),
        openIdConnectConfig: json['openIDConnectConfig'] == null
            ? null
            : DefaultAuthenticationTypeOpenIdConnectConfig.fromJson(
                json['openIDConnectConfig']),
      );

  Map<String, dynamic> toJson() => {
        if (authenticationType != null)
          'authenticationType': amplifyAppSyncSimulatorAuthenticationTypeValues
              .reverse[authenticationType],
        if (cognitoUserPoolConfig != null)
          'cognitoUserPoolConfig': cognitoUserPoolConfig?.toJson(),
        if (openIdConnectConfig != null)
          'openIDConnectConfig': openIdConnectConfig?.toJson(),
      };
}

class DefaultAuthenticationTypeCognitoUserPoolConfig {
  DefaultAuthenticationTypeCognitoUserPoolConfig({
    this.appIdClientRegex,
  });

  String? appIdClientRegex;

  factory DefaultAuthenticationTypeCognitoUserPoolConfig.fromJson(
          Map<String, dynamic> json) =>
      DefaultAuthenticationTypeCognitoUserPoolConfig(
        appIdClientRegex:
            json['AppIdClientRegex'] == null ? null : json['AppIdClientRegex'],
      );

  Map<String, dynamic> toJson() => {
        if (appIdClientRegex != null) 'AppIdClientRegex': appIdClientRegex,
      };
}

class DefaultAuthenticationTypeOpenIdConnectConfig {
  DefaultAuthenticationTypeOpenIdConnectConfig({
    this.clientId,
    this.issuer,
  });

  String? clientId;
  String? issuer;

  factory DefaultAuthenticationTypeOpenIdConnectConfig.fromJson(
          Map<String, dynamic> json) =>
      DefaultAuthenticationTypeOpenIdConnectConfig(
        clientId: json['ClientId'] == null ? null : json['ClientId'],
        issuer: json['Issuer'] == null ? null : json['Issuer'],
      );

  Map<String, dynamic> toJson() => {
        if (clientId != null) 'ClientId': clientId,
        if (issuer != null) 'Issuer': issuer,
      };
}

class AppSyncSimulatorDataSourceConfig {
  AppSyncSimulatorDataSourceConfig({
    this.config,
    this.name,
    this.type,
    this.invoke,
  });

  DataSourceConfig? config;
  String? name;
  Type? type;
  JsFunction? invoke;

  factory AppSyncSimulatorDataSourceConfig.fromJson(
          Map<String, dynamic> json) =>
      AppSyncSimulatorDataSourceConfig(
        config: json['config'] == null
            ? null
            : DataSourceConfig.fromJson(json['config']),
        name: json['name'] == null ? null : json['name'],
        type: json['type'] == null ? null : typeValues.map[json['type']],
        invoke:
            json['invoke'] == null ? null : JsFunction.fromJson(json['invoke']),
      );

  Map<String, dynamic> toJson() => {
        if (config != null) 'config': config?.toJson(),
        if (name != null) 'name': name,
        if (type != null) 'type': typeValues.reverse[type],
        if (invoke != null) 'invoke': invoke?.toJson(),
      };
}

class DataSourceConfig {
  DataSourceConfig({
    this.accessKeyId,
    this.endpoint,
    this.region,
    this.secretAccessKey,
    this.tableName,
  });

  String? accessKeyId;
  String? endpoint;
  String? region;
  String? secretAccessKey;
  String? tableName;

  factory DataSourceConfig.fromJson(Map<String, dynamic> json) =>
      DataSourceConfig(
        accessKeyId: json['accessKeyId'] == null ? null : json['accessKeyId'],
        endpoint: json['endpoint'] == null ? null : json['endpoint'],
        region: json['region'] == null ? null : json['region'],
        secretAccessKey:
            json['secretAccessKey'] == null ? null : json['secretAccessKey'],
        tableName: json['tableName'] == null ? null : json['tableName'],
      );

  Map<String, dynamic> toJson() => {
        if (accessKeyId != null) 'accessKeyId': accessKeyId,
        if (endpoint != null) 'endpoint': endpoint,
        if (region != null) 'region': region,
        if (secretAccessKey != null) 'secretAccessKey': secretAccessKey,
        if (tableName != null) 'tableName': tableName,
      };
}

class JsFunction {
  JsFunction({
    required this.arguments,
    this.caller,
    this.length,
    this.name,
    required this.prototype,
  });

  dynamic arguments;
  JsFunction? caller;
  double? length;
  String? name;
  dynamic prototype;

  factory JsFunction.fromJson(Map<String, dynamic> json) => JsFunction(
        arguments: json['arguments'],
        caller:
            json['caller'] == null ? null : JsFunction.fromJson(json['caller']),
        length: json['length'] == null ? null : json['length'].toDouble(),
        name: json['name'] == null ? null : json['name'],
        prototype: json['prototype'],
      );

  Map<String, dynamic> toJson() => {
        'arguments': arguments,
        if (caller != null) 'caller': caller?.toJson(),
        if (length != null) 'length': length,
        if (name != null) 'name': name,
        'prototype': prototype,
      };
}

enum Type { AMAZON_DYNAMODB, NONE, AWS_LAMBDA }

final typeValues = EnumValues({
  "AMAZON_DYNAMODB": Type.AMAZON_DYNAMODB,
  "AWS_LAMBDA": Type.AWS_LAMBDA,
  "None": Type.NONE
});

class FunctionElement {
  FunctionElement({
    this.dataSourceName,
    this.name,
    this.requestMappingTemplateLocation,
    this.responseMappingTemplateLocation,
  });

  String? dataSourceName;
  String? name;
  String? requestMappingTemplateLocation;
  String? responseMappingTemplateLocation;

  factory FunctionElement.fromJson(Map<String, dynamic> json) =>
      FunctionElement(
        dataSourceName:
            json['dataSourceName'] == null ? null : json['dataSourceName'],
        name: json['name'] == null ? null : json['name'],
        requestMappingTemplateLocation:
            json['requestMappingTemplateLocation'] == null
                ? null
                : json['requestMappingTemplateLocation'],
        responseMappingTemplateLocation:
            json['responseMappingTemplateLocation'] == null
                ? null
                : json['responseMappingTemplateLocation'],
      );

  Map<String, dynamic> toJson() => {
        if (dataSourceName != null) 'dataSourceName': dataSourceName,
        if (name != null) 'name': name,
        if (requestMappingTemplateLocation != null)
          'requestMappingTemplateLocation': requestMappingTemplateLocation,
        if (responseMappingTemplateLocation != null)
          'responseMappingTemplateLocation': responseMappingTemplateLocation,
      };
}

class MappingTemplate {
  MappingTemplate({
    this.content,
    this.path,
  });

  String? content;
  String? path;

  factory MappingTemplate.fromJson(Map<String, dynamic> json) =>
      MappingTemplate(
        content: json['content'] == null ? null : json['content'],
        path: json['path'] == null ? null : json['path'],
      );

  Map<String, dynamic> toJson() => {
        if (content != null) 'content': content,
        if (path != null) 'path': path,
      };
}

class AppSyncSimulatorResolverConfig {
  AppSyncSimulatorResolverConfig({
    this.dataSourceName,
    this.fieldName,
    this.kind,
    this.requestMappingTemplate,
    this.requestMappingTemplateLocation,
    this.responseMappingTemplate,
    this.responseMappingTemplateLocation,
    this.typeName,
    this.functions,
  });

  String? dataSourceName;
  String? fieldName;
  Kind? kind;
  String? requestMappingTemplate;
  String? requestMappingTemplateLocation;
  String? responseMappingTemplate;
  String? responseMappingTemplateLocation;
  String? typeName;
  List<String>? functions;

  factory AppSyncSimulatorResolverConfig.fromJson(Map<String, dynamic> json) =>
      AppSyncSimulatorResolverConfig(
        dataSourceName:
            json['dataSourceName'] == null ? null : json['dataSourceName'],
        fieldName: json['fieldName'] == null ? null : json['fieldName'],
        kind: json['kind'] == null ? null : kindValues.map[json['kind']],
        requestMappingTemplate: json['requestMappingTemplate'] == null
            ? null
            : json['requestMappingTemplate'],
        requestMappingTemplateLocation:
            json['requestMappingTemplateLocation'] == null
                ? null
                : json['requestMappingTemplateLocation'],
        responseMappingTemplate: json['responseMappingTemplate'] == null
            ? null
            : json['responseMappingTemplate'],
        responseMappingTemplateLocation:
            json['responseMappingTemplateLocation'] == null
                ? null
                : json['responseMappingTemplateLocation'],
        typeName: json['typeName'] == null ? null : json['typeName'],
        functions: json['functions'] == null
            ? null
            : List<String>.from(json['functions'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        if (dataSourceName != null) 'dataSourceName': dataSourceName,
        if (fieldName != null) 'fieldName': fieldName,
        if (kind != null) 'kind': kindValues.reverse[kind],
        if (requestMappingTemplate != null)
          'requestMappingTemplate': requestMappingTemplate,
        if (requestMappingTemplateLocation != null)
          'requestMappingTemplateLocation': requestMappingTemplateLocation,
        if (responseMappingTemplate != null)
          'responseMappingTemplate': responseMappingTemplate,
        if (responseMappingTemplateLocation != null)
          'responseMappingTemplateLocation': responseMappingTemplateLocation,
        if (typeName != null) 'typeName': typeName,
        if (functions != null)
          'functions': List<dynamic>.from(functions!.map((x) => x)),
      };
}

enum Kind { UNIT, PIPELINE }

final kindValues = EnumValues({"PIPELINE": Kind.PIPELINE, "UNIT": Kind.UNIT});

class Schema {
  Schema({
    this.content,
    this.path,
  });

  String? content;
  String? path;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        content: json['content'] == null ? null : json['content'],
        path: json['path'] == null ? null : json['path'],
      );

  Map<String, dynamic> toJson() => {
        if (content != null) 'content': content,
        if (path != null) 'path': path,
      };
}

class ExecutionContext {
  ExecutionContext({
    this.headers,
    this.jwt,
    this.requestAuthorizationMode,
    this.sourceIp,
  });

  Map<String, String>? headers;
  Jwt? jwt;
  AmplifyAppSyncSimulatorAuthenticationType? requestAuthorizationMode;
  String? sourceIp;

  factory ExecutionContext.fromJson(Map<String, dynamic> json) =>
      ExecutionContext(
        headers: json['headers'] == null
            ? null
            : Map.from(json['headers'])
                .map((k, v) => MapEntry<String, String>(k, v)),
        jwt: json['jwt'] == null ? null : Jwt.fromJson(json['jwt']),
        requestAuthorizationMode: json['requestAuthorizationMode'] == null
            ? null
            : amplifyAppSyncSimulatorAuthenticationTypeValues
                .map[json['requestAuthorizationMode']],
        sourceIp: json['sourceIp'] == null ? null : json['sourceIp'],
      );

  Map<String, dynamic> toJson() => {
        if (headers != null)
          'headers':
              Map.from(headers!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (jwt != null) 'jwt': jwt?.toJson(),
        if (requestAuthorizationMode != null)
          'requestAuthorizationMode':
              amplifyAppSyncSimulatorAuthenticationTypeValues
                  .reverse[requestAuthorizationMode],
        if (sourceIp != null) 'sourceIp': sourceIp,
      };
}

class Jwt {
  Jwt({
    this.aud,
    this.cognitoUsername,
    this.exp,
    this.iat,
    this.iss,
    this.nbf,
    this.sub,
    this.username,
  });

  String? aud;
  String? cognitoUsername;
  double? exp;
  double? iat;
  String? iss;
  double? nbf;
  String? sub;
  String? username;

  factory Jwt.fromJson(Map<String, dynamic> json) => Jwt(
        aud: json['aud'] == null ? null : json['aud'],
        cognitoUsername:
            json['cognito:username'] == null ? null : json['cognito:username'],
        exp: json['exp'] == null ? null : json['exp'].toDouble(),
        iat: json['iat'] == null ? null : json['iat'].toDouble(),
        iss: json['iss'] == null ? null : json['iss'],
        nbf: json['nbf'] == null ? null : json['nbf'].toDouble(),
        sub: json['sub'] == null ? null : json['sub'],
        username: json['username'] == null ? null : json['username'],
      );

  Map<String, dynamic> toJson() => {
        if (aud != null) 'aud': aud,
        if (cognitoUsername != null) 'cognito:username': cognitoUsername,
        if (exp != null) 'exp': exp,
        if (iat != null) 'iat': iat,
        if (iss != null) 'iss': iss,
        if (nbf != null) 'nbf': nbf,
        if (sub != null) 'sub': sub,
        if (username != null) 'username': username,
      };
}

class RenderContext {
  RenderContext({
    this.arguments,
    required this.error,
    required this.prevResult,
    required this.result,
    this.source,
    this.stash,
  });

  Map<String, dynamic>? arguments;
  dynamic error;
  dynamic prevResult;
  dynamic result;
  Map<String, dynamic>? source;
  Map<String, dynamic>? stash;

  factory RenderContext.fromJson(Map<String, dynamic> json) => RenderContext(
        arguments: json['arguments'] == null
            ? null
            : Map.from(json['arguments'])
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        error: json['error'],
        prevResult: json['prevResult'],
        result: json['result'],
        source: json['source'] == null
            ? null
            : Map.from(json['source'])
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        stash: json['stash'] == null
            ? null
            : Map.from(json['stash'])
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        if (arguments != null)
          'arguments': Map.from(arguments!)
              .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'error': error,
        'prevResult': prevResult,
        'result': result,
        if (source != null)
          'source':
              Map.from(source!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (stash != null)
          'stash':
              Map.from(stash!).map((k, v) => MapEntry<String, dynamic>(k, v)),
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
