import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:amplify_explorer/model/transform_request.dart';

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
  TransformerVersion,
])
final Serializers serializers =
    (_$serializers.toBuilder()..add(AppSyncAuthModeSerializer())).build();
