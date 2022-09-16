// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestedCredential _$RequestedCredentialFromJson(Map<String, dynamic> json) =>
    RequestedCredential(
      type: json['type'] as String,
      purpose: json['purpose'] as String,
      acceptedIssuers: (json['acceptedIssuers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      configuration: RequestedCredentialConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestedCredentialToJson(
        RequestedCredential instance) =>
    <String, dynamic>{
      'type': instance.type,
      'purpose': instance.purpose,
      'acceptedIssuers': instance.acceptedIssuers,
      'configuration': instance.configuration,
    };
