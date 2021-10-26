// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claimant.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Claimant> _$claimantSerializer = new _$ClaimantSerializer();

class _$ClaimantSerializer implements StructuredSerializer<Claimant> {
  @override
  final Iterable<Type> types = const [Claimant, _$Claimant];
  @override
  final String wireName = 'Claimant';

  @override
  Iterable<Object?> serialize(Serializers serializers, Claimant object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'provider',
      serializers.serialize(object.provider,
          specifiedType: const FullType(AuthProvider)),
    ];
    Object? value;
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
    return result;
  }

  @override
  Claimant deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClaimantBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'provider':
          result.provider = serializers.deserialize(value,
              specifiedType: const FullType(AuthProvider)) as AuthProvider;
          break;
        case 'identityClaim':
          result.identityClaim = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groupClaim':
          result.groupClaim = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Claimant extends Claimant {
  @override
  final AuthProvider provider;
  @override
  final String? identityClaim;
  @override
  final String? groupClaim;

  factory _$Claimant([void Function(ClaimantBuilder)? updates]) =>
      (new ClaimantBuilder()..update(updates)).build();

  _$Claimant._({required this.provider, this.identityClaim, this.groupClaim})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(provider, 'Claimant', 'provider');
  }

  @override
  Claimant rebuild(void Function(ClaimantBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClaimantBuilder toBuilder() => new ClaimantBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Claimant &&
        provider == other.provider &&
        identityClaim == other.identityClaim &&
        groupClaim == other.groupClaim;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, provider.hashCode), identityClaim.hashCode),
        groupClaim.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Claimant')
          ..add('provider', provider)
          ..add('identityClaim', identityClaim)
          ..add('groupClaim', groupClaim))
        .toString();
  }
}

class ClaimantBuilder implements Builder<Claimant, ClaimantBuilder> {
  _$Claimant? _$v;

  AuthProvider? _provider;
  AuthProvider? get provider => _$this._provider;
  set provider(AuthProvider? provider) => _$this._provider = provider;

  String? _identityClaim;
  String? get identityClaim => _$this._identityClaim;
  set identityClaim(String? identityClaim) =>
      _$this._identityClaim = identityClaim;

  String? _groupClaim;
  String? get groupClaim => _$this._groupClaim;
  set groupClaim(String? groupClaim) => _$this._groupClaim = groupClaim;

  ClaimantBuilder();

  ClaimantBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provider = $v.provider;
      _identityClaim = $v.identityClaim;
      _groupClaim = $v.groupClaim;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Claimant other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Claimant;
  }

  @override
  void update(void Function(ClaimantBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Claimant build() {
    Claimant._setDefaults(this);
    final _$result = _$v ??
        new _$Claimant._(
            provider: BuiltValueNullFieldError.checkNotNull(
                provider, 'Claimant', 'provider'),
            identityClaim: identityClaim,
            groupClaim: groupClaim);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
