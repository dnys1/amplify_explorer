// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExplorerConfig> _$explorerConfigSerializer =
    new _$ExplorerConfigSerializer();

class _$ExplorerConfigSerializer
    implements StructuredSerializer<ExplorerConfig> {
  @override
  final Iterable<Type> types = const [ExplorerConfig, _$ExplorerConfig];
  @override
  final String wireName = 'ExplorerConfig';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExplorerConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'schema',
      serializers.serialize(object.schema,
          specifiedType: const FullType(String)),
      'defaultAuthMode',
      serializers.serialize(object.defaultAuthMode,
          specifiedType: const FullType(AppSyncAuthMode)),
      'additionalAuthModes',
      serializers.serialize(object.additionalAuthModes,
          specifiedType: const FullType(
              BuiltSet, const [const FullType(AppSyncAuthMode)])),
    ];

    return result;
  }

  @override
  ExplorerConfig deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExplorerConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'schema':
          result.schema = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'defaultAuthMode':
          result.defaultAuthMode = serializers.deserialize(value,
                  specifiedType: const FullType(AppSyncAuthMode))
              as AppSyncAuthMode;
          break;
        case 'additionalAuthModes':
          result.additionalAuthModes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(AppSyncAuthMode)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ExplorerConfig extends ExplorerConfig {
  @override
  final String schema;
  @override
  final AppSyncAuthMode defaultAuthMode;
  @override
  final BuiltSet<AppSyncAuthMode> additionalAuthModes;

  factory _$ExplorerConfig([void Function(ExplorerConfigBuilder)? updates]) =>
      (new ExplorerConfigBuilder()..update(updates)).build();

  _$ExplorerConfig._(
      {required this.schema,
      required this.defaultAuthMode,
      required this.additionalAuthModes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(schema, 'ExplorerConfig', 'schema');
    BuiltValueNullFieldError.checkNotNull(
        defaultAuthMode, 'ExplorerConfig', 'defaultAuthMode');
    BuiltValueNullFieldError.checkNotNull(
        additionalAuthModes, 'ExplorerConfig', 'additionalAuthModes');
  }

  @override
  ExplorerConfig rebuild(void Function(ExplorerConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExplorerConfigBuilder toBuilder() =>
      new ExplorerConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExplorerConfig &&
        schema == other.schema &&
        defaultAuthMode == other.defaultAuthMode &&
        additionalAuthModes == other.additionalAuthModes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, schema.hashCode), defaultAuthMode.hashCode),
        additionalAuthModes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExplorerConfig')
          ..add('schema', schema)
          ..add('defaultAuthMode', defaultAuthMode)
          ..add('additionalAuthModes', additionalAuthModes))
        .toString();
  }
}

class ExplorerConfigBuilder
    implements Builder<ExplorerConfig, ExplorerConfigBuilder> {
  _$ExplorerConfig? _$v;

  String? _schema;
  String? get schema => _$this._schema;
  set schema(String? schema) => _$this._schema = schema;

  AppSyncAuthMode? _defaultAuthMode;
  AppSyncAuthMode? get defaultAuthMode => _$this._defaultAuthMode;
  set defaultAuthMode(AppSyncAuthMode? defaultAuthMode) =>
      _$this._defaultAuthMode = defaultAuthMode;

  SetBuilder<AppSyncAuthMode>? _additionalAuthModes;
  SetBuilder<AppSyncAuthMode> get additionalAuthModes =>
      _$this._additionalAuthModes ??= new SetBuilder<AppSyncAuthMode>();
  set additionalAuthModes(SetBuilder<AppSyncAuthMode>? additionalAuthModes) =>
      _$this._additionalAuthModes = additionalAuthModes;

  ExplorerConfigBuilder() {
    ExplorerConfig._setDefaults(this);
  }

  ExplorerConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _schema = $v.schema;
      _defaultAuthMode = $v.defaultAuthMode;
      _additionalAuthModes = $v.additionalAuthModes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExplorerConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExplorerConfig;
  }

  @override
  void update(void Function(ExplorerConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExplorerConfig build() {
    _$ExplorerConfig _$result;
    try {
      _$result = _$v ??
          new _$ExplorerConfig._(
              schema: BuiltValueNullFieldError.checkNotNull(
                  schema, 'ExplorerConfig', 'schema'),
              defaultAuthMode: BuiltValueNullFieldError.checkNotNull(
                  defaultAuthMode, 'ExplorerConfig', 'defaultAuthMode'),
              additionalAuthModes: additionalAuthModes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'additionalAuthModes';
        additionalAuthModes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ExplorerConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
