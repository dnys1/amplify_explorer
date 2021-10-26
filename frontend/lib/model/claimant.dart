import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:uuid/uuid.dart';

import 'auth_rule.dart';
import 'serializers.dart';

part 'claimant.g.dart';

abstract class Claimant implements Built<Claimant, ClaimantBuilder> {
  @BuiltValueHook(finalizeBuilder: true)
  static void _setDefaults(ClaimantBuilder b) {
    b.provider ??= AuthProvider.apiKey;
    switch (b.provider) {
      case AuthProvider.apiKey:
        break;
      case AuthProvider.iam:
      case AuthProvider.oidc:
      case AuthProvider.userPools:
        b.identityClaim ??= const Uuid().v4().toString();
        break;
    }
  }

  AuthProvider get provider;
  String? get identityClaim;
  String? get groupClaim;

  Claimant._();
  factory Claimant([void Function(ClaimantBuilder) updates]) = _$Claimant;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Claimant.serializer, this)
        as Map<String, dynamic>;
  }

  static Claimant? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Claimant.serializer, json);
  }

  static Serializer<Claimant> get serializer => _$claimantSerializer;
}
