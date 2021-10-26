import 'package:appsync_explorer/editor/editor_component.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';
import 'transform_request.g.dart';

part 'config.g.dart';

abstract class ExplorerConfig
    implements Built<ExplorerConfig, ExplorerConfigBuilder> {
  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(ExplorerConfigBuilder b) => b
    ..schema = defaultSchema
    ..defaultAuthMode = AppSyncAuthMode.API_KEY
    ..additionalAuthModes.clear();

  ExplorerConfig._();

  String get schema;
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
    return AppSyncAuthMode.values.firstWhere((el) => el.name == serialized);
  }

  @override
  Object serialize(Serializers serializers, AppSyncAuthMode object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.name;
  }
}
