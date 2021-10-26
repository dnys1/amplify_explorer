// To parse this JSON data, do
//
//     final transformResponse = transformResponseFromJson(jsonString);

import 'dart:convert';

TransformResponse transformResponseFromJson(String str) => TransformResponse.fromJson(json.decode(str));

String transformResponseToJson(TransformResponse data) => json.encode(data.toJson());

class TransformResponse {
    TransformResponse({
         this.functions,
         this.pipelineFunctions,
         this.resolvers,
         this.rootStack,
         this.schema,
         this.stackMapping,
         this.stacks,
    });

    Map<String, String>? functions;
    Map<String, String>? pipelineFunctions;
    Map<String, String>? resolvers;
    Default? rootStack;
    String? schema;
    Map<String, String>? stackMapping;
    Map<String, Default>? stacks;

    factory TransformResponse.fromJson(Map<String, dynamic> json) => TransformResponse(
        functions: 
        json['functions'] == null ? null :
        Map.from(json['functions']).map((k, v) => MapEntry<String, String>(k, v)),
        pipelineFunctions: 
        json['pipelineFunctions'] == null ? null :
        Map.from(json['pipelineFunctions']).map((k, v) => MapEntry<String, String>(k, v)),
        resolvers: 
        json['resolvers'] == null ? null :
        Map.from(json['resolvers']).map((k, v) => MapEntry<String, String>(k, v)),
        rootStack: 
        json['rootStack'] == null ? null :
        Default.fromJson(json['rootStack']),
        schema: 
        json['schema'] == null ? null :
        json['schema'],
        stackMapping: 
        json['stackMapping'] == null ? null :
        Map.from(json['stackMapping']).map((k, v) => MapEntry<String, String>(k, v)),
        stacks: 
        json['stacks'] == null ? null :
        Map.from(json['stacks']).map((k, v) => MapEntry<String, Default>(k, Default.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        if (functions != null)
        'functions': Map.from(functions!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (pipelineFunctions != null)
        'pipelineFunctions': Map.from(pipelineFunctions!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (resolvers != null)
        'resolvers': Map.from(resolvers!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (rootStack != null)
        'rootStack': rootStack?.toJson(),
        if (schema != null)
        'schema': schema,
        if (stackMapping != null)
        'stackMapping': Map.from(stackMapping!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (stacks != null)
        'stacks': Map.from(stacks!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Default {
    Default({
         this.awsTemplateFormatVersion,
         this.conditions,
         this.description,
         this.mappings,
         this.metadata,
         this.outputs,
         this.parameters,
         this.resources,
        required this.transform,
    });

    String? awsTemplateFormatVersion;
    Map<String, ConditionIntrinsicFunction>? conditions;
    String? description;
    Map<String, Map<String, Map<String, dynamic>>>? mappings;
    Map<String, dynamic>? metadata;
    Map<String, Default3>? outputs;
    Map<String, Default1>? parameters;
    Map<String, Default2>? resources;
    dynamic transform;

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        awsTemplateFormatVersion: 
        json['AWSTemplateFormatVersion'] == null ? null :
        json['AWSTemplateFormatVersion'],
        conditions: 
        json['Conditions'] == null ? null :
        Map.from(json['Conditions']).map((k, v) => MapEntry<String, ConditionIntrinsicFunction>(k, ConditionIntrinsicFunction.fromJson(v))),
        description: 
        json['Description'] == null ? null :
        json['Description'],
        mappings: 
        json['Mappings'] == null ? null :
        Map.from(json['Mappings']).map((k, v) => MapEntry<String, Map<String, Map<String, dynamic>>>(k, Map.from(v).map((k, v) => MapEntry<String, Map<String, dynamic>>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))))),
        metadata: 
        json['Metadata'] == null ? null :
        Map.from(json['Metadata']).map((k, v) => MapEntry<String, dynamic>(k, v)),
        outputs: 
        json['Outputs'] == null ? null :
        Map.from(json['Outputs']).map((k, v) => MapEntry<String, Default3>(k, Default3.fromJson(v))),
        parameters: 
        json['Parameters'] == null ? null :
        Map.from(json['Parameters']).map((k, v) => MapEntry<String, Default1>(k, Default1.fromJson(v))),
        resources: 
        json['Resources'] == null ? null :
        Map.from(json['Resources']).map((k, v) => MapEntry<String, Default2>(k, Default2.fromJson(v))),
        transform: 
        json['Transform'],
    );

    Map<String, dynamic> toJson() => {
        if (awsTemplateFormatVersion != null)
        'AWSTemplateFormatVersion': awsTemplateFormatVersion,
        if (conditions != null)
        'Conditions': Map.from(conditions!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        if (description != null)
        'Description': description,
        if (mappings != null)
        'Mappings': Map.from(mappings!).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))))),
        if (metadata != null)
        'Metadata': Map.from(metadata!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (outputs != null)
        'Outputs': Map.from(outputs!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        if (parameters != null)
        'Parameters': Map.from(parameters!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        if (resources != null)
        'Resources': Map.from(resources!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        'Transform': transform,
    };
}

class ConditionIntrinsicFunction {
    ConditionIntrinsicFunction({
        required this.name,
        required this.payload,
        required this.condition,
    });

    dynamic name;
    dynamic payload;
    dynamic condition;

    factory ConditionIntrinsicFunction.fromJson(Map<String, dynamic> json) => ConditionIntrinsicFunction(
        name: 
        json['name'],
        payload: 
        json['payload'],
        condition: 
        json['Condition'],
    );

    Map<String, dynamic> toJson() => {
        'name': name,
        'payload': payload,
        'Condition': condition,
    };
}

class IntrinsicFunction {
    IntrinsicFunction({
        required this.name,
        required this.payload,
    });

    dynamic name;
    dynamic payload;

    factory IntrinsicFunction.fromJson(Map<String, dynamic> json) => IntrinsicFunction(
        name: 
        json['name'],
        payload: 
        json['payload'],
    );

    Map<String, dynamic> toJson() => {
        'name': name,
        'payload': payload,
    };
}

class Default3 {
    Default3({
        required this.condition,
        required this.description,
         this.default3Export,
        required this.value,
    });

    dynamic condition;
    dynamic description;
    Export? default3Export;
    dynamic value;

    factory Default3.fromJson(Map<String, dynamic> json) => Default3(
        condition: 
        json['Condition'],
        description: 
        json['Description'],
        default3Export: 
        json['Export'] == null ? null :
        Export.fromJson(json['Export']),
        value: 
        json['Value'],
    );

    Map<String, dynamic> toJson() => {
        'Condition': condition,
        'Description': description,
        if (default3Export != null)
        'Export': default3Export?.toJson(),
        'Value': value,
    };
}

class Export {
    Export({
        required this.name,
    });

    dynamic name;

    factory Export.fromJson(Map<String, dynamic> json) => Export(
        name: 
        json['Name'],
    );

    Map<String, dynamic> toJson() => {
        'Name': name,
    };
}

class Default1 {
    Default1({
         this.allowedPattern,
         this.allowedValues,
         this.constraintDescription,
        required this.default1Default,
         this.description,
         this.maxLength,
         this.maxValue,
         this.minLength,
         this.minValue,
         this.noEcho,
         this.type,
    });

    String? allowedPattern;
    List<dynamic>? allowedValues;
    String? constraintDescription;
    dynamic default1Default;
    String? description;
    double? maxLength;
    double? maxValue;
    double? minLength;
    double? minValue;
    bool? noEcho;
    String? type;

    factory Default1.fromJson(Map<String, dynamic> json) => Default1(
        allowedPattern: 
        json['AllowedPattern'] == null ? null :
        json['AllowedPattern'],
        allowedValues: 
        json['AllowedValues'] == null ? null :
        List<dynamic>.from(json['AllowedValues'].map((x) => x)),
        constraintDescription: 
        json['ConstraintDescription'] == null ? null :
        json['ConstraintDescription'],
        default1Default: 
        json['Default'],
        description: 
        json['Description'] == null ? null :
        json['Description'],
        maxLength: 
        json['MaxLength'] == null ? null :
        json['MaxLength'].toDouble(),
        maxValue: 
        json['MaxValue'] == null ? null :
        json['MaxValue'].toDouble(),
        minLength: 
        json['MinLength'] == null ? null :
        json['MinLength'].toDouble(),
        minValue: 
        json['MinValue'] == null ? null :
        json['MinValue'].toDouble(),
        noEcho: 
        json['NoEcho'] == null ? null :
        json['NoEcho'],
        type: 
        json['Type'] == null ? null :
        json['Type'],
    );

    Map<String, dynamic> toJson() => {
        if (allowedPattern != null)
        'AllowedPattern': allowedPattern,
        if (allowedValues != null)
        'AllowedValues': List<dynamic>.from(allowedValues!.map((x) => x)),
        if (constraintDescription != null)
        'ConstraintDescription': constraintDescription,
        'Default': default1Default,
        if (description != null)
        'Description': description,
        if (maxLength != null)
        'MaxLength': maxLength,
        if (maxValue != null)
        'MaxValue': maxValue,
        if (minLength != null)
        'MinLength': minLength,
        if (minValue != null)
        'MinValue': minValue,
        if (noEcho != null)
        'NoEcho': noEcho,
        if (type != null)
        'Type': type,
    };
}

class Default2 {
    Default2({
        required this.condition,
         this.creationPolicy,
         this.deletionPolicy,
        required this.dependsOn,
         this.metadata,
         this.properties,
         this.type,
         this.updatePolicy,
    });

    dynamic condition;
    CreationPolicy? creationPolicy;
    DeletionPolicy? deletionPolicy;
    dynamic dependsOn;
    Map<String, dynamic>? metadata;
    Map<String, dynamic>? properties;
    String? type;
    UpdatePolicy? updatePolicy;

    factory Default2.fromJson(Map<String, dynamic> json) => Default2(
        condition: 
        json['Condition'],
        creationPolicy: 
        json['CreationPolicy'] == null ? null :
        CreationPolicy.fromJson(json['CreationPolicy']),
        deletionPolicy: 
        json['DeletionPolicy'] == null ? null :
        deletionPolicyValues.map[json['DeletionPolicy']],
        dependsOn: 
        json['DependsOn'],
        metadata: 
        json['Metadata'] == null ? null :
        Map.from(json['Metadata']).map((k, v) => MapEntry<String, dynamic>(k, v)),
        properties: 
        json['Properties'] == null ? null :
        Map.from(json['Properties']).map((k, v) => MapEntry<String, dynamic>(k, v)),
        type: 
        json['Type'] == null ? null :
        json['Type'],
        updatePolicy: 
        json['UpdatePolicy'] == null ? null :
        UpdatePolicy.fromJson(json['UpdatePolicy']),
    );

    Map<String, dynamic> toJson() => {
        'Condition': condition,
        if (creationPolicy != null)
        'CreationPolicy': creationPolicy?.toJson(),
        if (deletionPolicy != null)
        'DeletionPolicy': deletionPolicyValues.reverse[deletionPolicy],
        'DependsOn': dependsOn,
        if (metadata != null)
        'Metadata': Map.from(metadata!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (properties != null)
        'Properties': Map.from(properties!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        if (type != null)
        'Type': type,
        if (updatePolicy != null)
        'UpdatePolicy': updatePolicy?.toJson(),
    };
}

class CreationPolicy {
    CreationPolicy({
         this.autoScalingCreationPolicy,
         this.resourceSignal,
    });

    AutoScalingCreationPolicy? autoScalingCreationPolicy;
    ResourceSignal? resourceSignal;

    factory CreationPolicy.fromJson(Map<String, dynamic> json) => CreationPolicy(
        autoScalingCreationPolicy: 
        json['AutoScalingCreationPolicy'] == null ? null :
        AutoScalingCreationPolicy.fromJson(json['AutoScalingCreationPolicy']),
        resourceSignal: 
        json['ResourceSignal'] == null ? null :
        ResourceSignal.fromJson(json['ResourceSignal']),
    );

    Map<String, dynamic> toJson() => {
        if (autoScalingCreationPolicy != null)
        'AutoScalingCreationPolicy': autoScalingCreationPolicy?.toJson(),
        if (resourceSignal != null)
        'ResourceSignal': resourceSignal?.toJson(),
    };
}

class AutoScalingCreationPolicy {
    AutoScalingCreationPolicy({
        required this.minSuccessfulInstancesPercent,
    });

    dynamic minSuccessfulInstancesPercent;

    factory AutoScalingCreationPolicy.fromJson(Map<String, dynamic> json) => AutoScalingCreationPolicy(
        minSuccessfulInstancesPercent: 
        json['MinSuccessfulInstancesPercent'],
    );

    Map<String, dynamic> toJson() => {
        'MinSuccessfulInstancesPercent': minSuccessfulInstancesPercent,
    };
}

class ResourceSignal {
    ResourceSignal({
        required this.count,
        required this.timeout,
    });

    dynamic count;
    dynamic timeout;

    factory ResourceSignal.fromJson(Map<String, dynamic> json) => ResourceSignal(
        count: 
        json['Count'],
        timeout: 
        json['Timeout'],
    );

    Map<String, dynamic> toJson() => {
        'Count': count,
        'Timeout': timeout,
    };
}

enum DeletionPolicy { DELETE, RETAIN, SNAPSHOT }

final deletionPolicyValues = EnumValues({
    "Delete": DeletionPolicy.DELETE,
    "Retain": DeletionPolicy.RETAIN,
    "Snapshot": DeletionPolicy.SNAPSHOT
});

class UpdatePolicy {
    UpdatePolicy({
         this.autoScalingReplacingUpdate,
         this.autoScalingRollingUpdate,
         this.autoScalingScheduledAction,
    });

    AutoScalingReplacingUpdate? autoScalingReplacingUpdate;
    AutoScalingRollingUpdate? autoScalingRollingUpdate;
    AutoScalingScheduledAction? autoScalingScheduledAction;

    factory UpdatePolicy.fromJson(Map<String, dynamic> json) => UpdatePolicy(
        autoScalingReplacingUpdate: 
        json['AutoScalingReplacingUpdate'] == null ? null :
        AutoScalingReplacingUpdate.fromJson(json['AutoScalingReplacingUpdate']),
        autoScalingRollingUpdate: 
        json['AutoScalingRollingUpdate'] == null ? null :
        AutoScalingRollingUpdate.fromJson(json['AutoScalingRollingUpdate']),
        autoScalingScheduledAction: 
        json['AutoScalingScheduledAction'] == null ? null :
        AutoScalingScheduledAction.fromJson(json['AutoScalingScheduledAction']),
    );

    Map<String, dynamic> toJson() => {
        if (autoScalingReplacingUpdate != null)
        'AutoScalingReplacingUpdate': autoScalingReplacingUpdate?.toJson(),
        if (autoScalingRollingUpdate != null)
        'AutoScalingRollingUpdate': autoScalingRollingUpdate?.toJson(),
        if (autoScalingScheduledAction != null)
        'AutoScalingScheduledAction': autoScalingScheduledAction?.toJson(),
    };
}

class AutoScalingReplacingUpdate {
    AutoScalingReplacingUpdate({
        required this.willReplace,
    });

    dynamic willReplace;

    factory AutoScalingReplacingUpdate.fromJson(Map<String, dynamic> json) => AutoScalingReplacingUpdate(
        willReplace: 
        json['WillReplace'],
    );

    Map<String, dynamic> toJson() => {
        'WillReplace': willReplace,
    };
}

class AutoScalingRollingUpdate {
    AutoScalingRollingUpdate({
        required this.maxBatchSize,
        required this.minInstancesInService,
        required this.minSuccessfulInstancesPercent,
        required this.pauseTime,
        required this.suspendProcesses,
        required this.waitOnResourceSignals,
    });

    dynamic maxBatchSize;
    dynamic minInstancesInService;
    dynamic minSuccessfulInstancesPercent;
    dynamic pauseTime;
    dynamic suspendProcesses;
    dynamic waitOnResourceSignals;

    factory AutoScalingRollingUpdate.fromJson(Map<String, dynamic> json) => AutoScalingRollingUpdate(
        maxBatchSize: 
        json['MaxBatchSize'],
        minInstancesInService: 
        json['MinInstancesInService'],
        minSuccessfulInstancesPercent: 
        json['MinSuccessfulInstancesPercent'],
        pauseTime: 
        json['PauseTime'],
        suspendProcesses: 
        json['SuspendProcesses'],
        waitOnResourceSignals: 
        json['WaitOnResourceSignals'],
    );

    Map<String, dynamic> toJson() => {
        'MaxBatchSize': maxBatchSize,
        'MinInstancesInService': minInstancesInService,
        'MinSuccessfulInstancesPercent': minSuccessfulInstancesPercent,
        'PauseTime': pauseTime,
        'SuspendProcesses': suspendProcesses,
        'WaitOnResourceSignals': waitOnResourceSignals,
    };
}

class AutoScalingScheduledAction {
    AutoScalingScheduledAction({
        required this.ignoreUnmodifiedGroupSizeProperties,
    });

    dynamic ignoreUnmodifiedGroupSizeProperties;

    factory AutoScalingScheduledAction.fromJson(Map<String, dynamic> json) => AutoScalingScheduledAction(
        ignoreUnmodifiedGroupSizeProperties: 
        json['IgnoreUnmodifiedGroupSizeProperties'],
    );

    Map<String, dynamic> toJson() => {
        'IgnoreUnmodifiedGroupSizeProperties': ignoreUnmodifiedGroupSizeProperties,
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
