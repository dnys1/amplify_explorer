import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:appsync_explorer/model/transform_request.g.dart';

import 'auth_rule.dart';
import 'claimant.dart';
import 'config.dart';

part 'serializers.g.dart';

@SerializersFor([
  AuthStrategy,
  AuthProvider,
  ModelOperation,
  AuthRule,
  Claimant,
  ExplorerConfig,
])
final Serializers serializers =
    (_$serializers.toBuilder()..add(AppSyncAuthModeSerializer())).build();
