import 'package:amplify_explorer/editor/editor_component.dart';
import 'package:amplify_explorer/model/enum.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';
import 'transform_request.dart';

part 'config.g.dart';

class TransformerVersion extends EnumClass {
  static const TransformerVersion v1 = _$v1;
  static const TransformerVersion v2 = _$v2;

  const TransformerVersion._(String name) : super(name);

  static BuiltSet<TransformerVersion> get values => _$TransformerVersionValues;
  static TransformerVersion valueOf(String name) =>
      _$TransformerVersionValueOf(name);

  String serialize() {
    return serializers.serializeWith(TransformerVersion.serializer, this)
        as String;
  }

  static TransformerVersion? deserialize(String string) {
    return serializers.deserializeWith(TransformerVersion.serializer, string);
  }

  static Serializer<TransformerVersion> get serializer =>
      _$transformerVersionSerializer;
}

abstract class ExplorerConfig
    implements Built<ExplorerConfig, ExplorerConfigBuilder> {
  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(ExplorerConfigBuilder b) => b
    ..schema = todoV2Schema
    ..transformerVersion = TransformerVersion.v2
    ..defaultAuthMode = AppSyncAuthMode.API_KEY
    ..additionalAuthModes.add(AppSyncAuthMode.AMAZON_COGNITO_USER_POOLS);

  ExplorerConfig._();

  String get schema;
  TransformerVersion get transformerVersion;
  AppSyncAuthMode get defaultAuthMode;
  BuiltSet<AppSyncAuthMode> get additionalAuthModes;

  factory ExplorerConfig([void Function(ExplorerConfigBuilder) updates]) =
      _$ExplorerConfig;

  Object? toJson() {
    return serializers.serializeWith(ExplorerConfig.serializer, this);
  }

  static ExplorerConfig? fromJson(Object? json) {
    return serializers.deserializeWith(ExplorerConfig.serializer, json);
  }

  static Serializer<ExplorerConfig> get serializer =>
      _$explorerConfigSerializer;
}

class AppSyncAuthModeSerializer extends PrimitiveSerializer<AppSyncAuthMode> {
  @override
  Iterable<Type> get types => [AppSyncAuthMode];

  @override
  String get wireName => 'AppSyncAuthMode';

  @override
  AppSyncAuthMode deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return AppSyncAuthMode.values
        .firstWhere((el) => describeEnum(el) == serialized);
  }

  @override
  Object serialize(Serializers serializers, AppSyncAuthMode object,
      {FullType specifiedType = FullType.unspecified}) {
    return describeEnum(object);
  }
}
