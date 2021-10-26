import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'auth_rule.g.dart';

class AuthStrategy extends EnumClass {
  static const AuthStrategy owner = _$owner;
  static const AuthStrategy groups = _$groups;
  static const AuthStrategy private = _$private;
  static const AuthStrategy public = _$public;

  const AuthStrategy._(String name) : super(name);

  static BuiltSet<AuthStrategy> get values => _$AuthStrategyValues;
  static AuthStrategy valueOf(String name) => _$AuthStrategyValueOf(name);

  String serialize() {
    return serializers.serializeWith(AuthStrategy.serializer, this) as String;
  }

  static AuthStrategy? deserialize(String string) {
    return serializers.deserializeWith(AuthStrategy.serializer, string);
  }

  static Serializer<AuthStrategy> get serializer => _$authStrategySerializer;
}

class AuthProvider extends EnumClass {
  static const AuthProvider apiKey = _$apiKey;
  static const AuthProvider iam = _$iam;
  static const AuthProvider oidc = _$oidc;
  static const AuthProvider userPools = _$userPools;

  const AuthProvider._(String name) : super(name);

  static BuiltSet<AuthProvider> get values => _$AuthProviderValues;
  static AuthProvider valueOf(String name) => _$AuthProviderValueOf(name);

  String serialize() {
    return serializers.serializeWith(AuthProvider.serializer, this) as String;
  }

  static AuthProvider? deserialize(String string) {
    return serializers.deserializeWith(AuthProvider.serializer, string);
  }

  static Serializer<AuthProvider> get serializer => _$authProviderSerializer;
}

class ModelOperation extends EnumClass {
  static const ModelOperation create = _$create;
  static const ModelOperation update = _$update;
  static const ModelOperation delete = _$delete;
  static const ModelOperation read = _$read;

  const ModelOperation._(String name) : super(name);

  static BuiltSet<ModelOperation> get values => _$ModelOperationValues;
  static ModelOperation valueOf(String name) => _$ModelOperationValueOf(name);

  String serialize() {
    return serializers.serializeWith(ModelOperation.serializer, this) as String;
  }

  static ModelOperation? deserialize(String string) {
    return serializers.deserializeWith(ModelOperation.serializer, string);
  }

  static Serializer<ModelOperation> get serializer =>
      _$modelOperationSerializer;
}

abstract class AuthRule implements Built<AuthRule, AuthRuleBuilder> {
  @BuiltValueHook(finalizeBuilder: true)
  static void _setDefaults(AuthRuleBuilder b) {
    switch (b.allow) {
      case AuthStrategy.groups:
        b.groupClaim ??= 'cognito:groups';
        if (b.groups.isNotEmpty && b.groupsField != null) {
          throw ArgumentError.value(
            b.groups,
            'Groups',
            'cannot use both static and dynamic group authorization',
          );
        }
        break;
      case AuthStrategy.owner:
        b.ownerField ??= 'owner';
        b.identityClaim ??= 'username';
        break;
      case AuthStrategy.private:
        break;
      case AuthStrategy.public:
        break;
    }
    if (b.operations.isEmpty) {
      b.operations.addAll(ModelOperation.values);
    }
  }

  AuthStrategy get allow;
  AuthProvider? get provider;
  String? get ownerField;
  String? get identityClaim;
  String? get groupClaim;
  BuiltSet<String> get groups;
  String? get groupsField;
  BuiltSet<ModelOperation> get operations;

  AuthRule._();
  factory AuthRule([void Function(AuthRuleBuilder) updates]) = _$AuthRule;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthRule.serializer, this)
        as Map<String, dynamic>;
  }

  static AuthRule? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthRule.serializer, json);
  }

  static Serializer<AuthRule> get serializer => _$authRuleSerializer;
}
