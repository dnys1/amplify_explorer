// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_rule.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AuthStrategy _$owner = const AuthStrategy._('owner');
const AuthStrategy _$groups = const AuthStrategy._('groups');
const AuthStrategy _$private = const AuthStrategy._('private');
const AuthStrategy _$public = const AuthStrategy._('public');

AuthStrategy _$AuthStrategyValueOf(String name) {
  switch (name) {
    case 'owner':
      return _$owner;
    case 'groups':
      return _$groups;
    case 'private':
      return _$private;
    case 'public':
      return _$public;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AuthStrategy> _$AuthStrategyValues =
    new BuiltSet<AuthStrategy>(const <AuthStrategy>[
  _$owner,
  _$groups,
  _$private,
  _$public,
]);

const AuthProvider _$apiKey = const AuthProvider._('apiKey');
const AuthProvider _$iam = const AuthProvider._('iam');
const AuthProvider _$oidc = const AuthProvider._('oidc');
const AuthProvider _$userPools = const AuthProvider._('userPools');

AuthProvider _$AuthProviderValueOf(String name) {
  switch (name) {
    case 'apiKey':
      return _$apiKey;
    case 'iam':
      return _$iam;
    case 'oidc':
      return _$oidc;
    case 'userPools':
      return _$userPools;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AuthProvider> _$AuthProviderValues =
    new BuiltSet<AuthProvider>(const <AuthProvider>[
  _$apiKey,
  _$iam,
  _$oidc,
  _$userPools,
]);

const ModelOperation _$create = const ModelOperation._('create');
const ModelOperation _$update = const ModelOperation._('update');
const ModelOperation _$delete = const ModelOperation._('delete');
const ModelOperation _$read = const ModelOperation._('read');

ModelOperation _$ModelOperationValueOf(String name) {
  switch (name) {
    case 'create':
      return _$create;
    case 'update':
      return _$update;
    case 'delete':
      return _$delete;
    case 'read':
      return _$read;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ModelOperation> _$ModelOperationValues =
    new BuiltSet<ModelOperation>(const <ModelOperation>[
  _$create,
  _$update,
  _$delete,
  _$read,
]);

Serializer<AuthStrategy> _$authStrategySerializer =
    new _$AuthStrategySerializer();
Serializer<AuthProvider> _$authProviderSerializer =
    new _$AuthProviderSerializer();
Serializer<ModelOperation> _$modelOperationSerializer =
    new _$ModelOperationSerializer();
Serializer<AuthRule> _$authRuleSerializer = new _$AuthRuleSerializer();

class _$AuthStrategySerializer implements PrimitiveSerializer<AuthStrategy> {
  @override
  final Iterable<Type> types = const <Type>[AuthStrategy];
  @override
  final String wireName = 'AuthStrategy';

  @override
  Object serialize(Serializers serializers, AuthStrategy object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AuthStrategy deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AuthStrategy.valueOf(serialized as String);
}

class _$AuthProviderSerializer implements PrimitiveSerializer<AuthProvider> {
  @override
  final Iterable<Type> types = const <Type>[AuthProvider];
  @override
  final String wireName = 'AuthProvider';

  @override
  Object serialize(Serializers serializers, AuthProvider object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AuthProvider deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AuthProvider.valueOf(serialized as String);
}

class _$ModelOperationSerializer
    implements PrimitiveSerializer<ModelOperation> {
  @override
  final Iterable<Type> types = const <Type>[ModelOperation];
  @override
  final String wireName = 'ModelOperation';

  @override
  Object serialize(Serializers serializers, ModelOperation object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ModelOperation deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ModelOperation.valueOf(serialized as String);
}

class _$AuthRuleSerializer implements StructuredSerializer<AuthRule> {
  @override
  final Iterable<Type> types = const [AuthRule, _$AuthRule];
  @override
  final String wireName = 'AuthRule';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthRule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'allow',
      serializers.serialize(object.allow,
          specifiedType: const FullType(AuthStrategy)),
      'groups',
      serializers.serialize(object.groups,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
      'operations',
      serializers.serialize(object.operations,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(ModelOperation)])),
    ];
    Object? value;
    value = object.provider;
    if (value != null) {
      result
        ..add('provider')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AuthProvider)));
    }
    value = object.ownerField;
    if (value != null) {
      result
        ..add('ownerField')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.identityClaim;
    if (value != null) {
      result
        ..add('identityClaim')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.groupClaim;
    if (value != null) {
      result
        ..add('groupClaim')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.groupsField;
    if (value != null) {
      result
        ..add('groupsField')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthRule deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthRuleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'allow':
          result.allow = serializers.deserialize(value,
              specifiedType: const FullType(AuthStrategy)) as AuthStrategy;
          break;
        case 'provider':
          result.provider = serializers.deserialize(value,
              specifiedType: const FullType(AuthProvider)) as AuthProvider?;
          break;
        case 'ownerField':
          result.ownerField = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'identityClaim':
          result.identityClaim = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groupClaim':
          result.groupClaim = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groups':
          result.groups.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'groupsField':
          result.groupsField = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'operations':
          result.operations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(ModelOperation)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AuthRule extends AuthRule {
  @override
  final AuthStrategy allow;
  @override
  final AuthProvider? provider;
  @override
  final String? ownerField;
  @override
  final String? identityClaim;
  @override
  final String? groupClaim;
  @override
  final BuiltSet<String> groups;
  @override
  final String? groupsField;
  @override
  final BuiltSet<ModelOperation> operations;

  factory _$AuthRule([void Function(AuthRuleBuilder)? updates]) =>
      (new AuthRuleBuilder()..update(updates)).build();

  _$AuthRule._(
      {required this.allow,
      this.provider,
      this.ownerField,
      this.identityClaim,
      this.groupClaim,
      required this.groups,
      this.groupsField,
      required this.operations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(allow, 'AuthRule', 'allow');
    BuiltValueNullFieldError.checkNotNull(groups, 'AuthRule', 'groups');
    BuiltValueNullFieldError.checkNotNull(operations, 'AuthRule', 'operations');
  }

  @override
  AuthRule rebuild(void Function(AuthRuleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthRuleBuilder toBuilder() => new AuthRuleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthRule &&
        allow == other.allow &&
        provider == other.provider &&
        ownerField == other.ownerField &&
        identityClaim == other.identityClaim &&
        groupClaim == other.groupClaim &&
        groups == other.groups &&
        groupsField == other.groupsField &&
        operations == other.operations;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, allow.hashCode), provider.hashCode),
                            ownerField.hashCode),
                        identityClaim.hashCode),
                    groupClaim.hashCode),
                groups.hashCode),
            groupsField.hashCode),
        operations.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthRule')
          ..add('allow', allow)
          ..add('provider', provider)
          ..add('ownerField', ownerField)
          ..add('identityClaim', identityClaim)
          ..add('groupClaim', groupClaim)
          ..add('groups', groups)
          ..add('groupsField', groupsField)
          ..add('operations', operations))
        .toString();
  }
}

class AuthRuleBuilder implements Builder<AuthRule, AuthRuleBuilder> {
  _$AuthRule? _$v;

  AuthStrategy? _allow;
  AuthStrategy? get allow => _$this._allow;
  set allow(AuthStrategy? allow) => _$this._allow = allow;

  AuthProvider? _provider;
  AuthProvider? get provider => _$this._provider;
  set provider(AuthProvider? provider) => _$this._provider = provider;

  String? _ownerField;
  String? get ownerField => _$this._ownerField;
  set ownerField(String? ownerField) => _$this._ownerField = ownerField;

  String? _identityClaim;
  String? get identityClaim => _$this._identityClaim;
  set identityClaim(String? identityClaim) =>
      _$this._identityClaim = identityClaim;

  String? _groupClaim;
  String? get groupClaim => _$this._groupClaim;
  set groupClaim(String? groupClaim) => _$this._groupClaim = groupClaim;

  SetBuilder<String>? _groups;
  SetBuilder<String> get groups => _$this._groups ??= new SetBuilder<String>();
  set groups(SetBuilder<String>? groups) => _$this._groups = groups;

  String? _groupsField;
  String? get groupsField => _$this._groupsField;
  set groupsField(String? groupsField) => _$this._groupsField = groupsField;

  SetBuilder<ModelOperation>? _operations;
  SetBuilder<ModelOperation> get operations =>
      _$this._operations ??= new SetBuilder<ModelOperation>();
  set operations(SetBuilder<ModelOperation>? operations) =>
      _$this._operations = operations;

  AuthRuleBuilder();

  AuthRuleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _allow = $v.allow;
      _provider = $v.provider;
      _ownerField = $v.ownerField;
      _identityClaim = $v.identityClaim;
      _groupClaim = $v.groupClaim;
      _groups = $v.groups.toBuilder();
      _groupsField = $v.groupsField;
      _operations = $v.operations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthRule other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthRule;
  }

  @override
  void update(void Function(AuthRuleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthRule build() {
    AuthRule._setDefaults(this);
    _$AuthRule _$result;
    try {
      _$result = _$v ??
          new _$AuthRule._(
              allow: BuiltValueNullFieldError.checkNotNull(
                  allow, 'AuthRule', 'allow'),
              provider: provider,
              ownerField: ownerField,
              identityClaim: identityClaim,
              groupClaim: groupClaim,
              groups: groups.build(),
              groupsField: groupsField,
              operations: operations.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'groups';
        groups.build();

        _$failedField = 'operations';
        operations.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthRule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
