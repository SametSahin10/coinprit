// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issuance_request_claims.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssuanceRequestClaims _$IssuanceRequestClaimsFromJson(
        Map<String, dynamic> json) =>
    IssuanceRequestClaims(
      firstName: json['given_name'] as String,
      lastName: json['family_name'] as String,
    );

Map<String, dynamic> _$IssuanceRequestClaimsToJson(
        IssuanceRequestClaims instance) =>
    <String, dynamic>{
      'given_name': instance.firstName,
      'family_name': instance.lastName,
    };
