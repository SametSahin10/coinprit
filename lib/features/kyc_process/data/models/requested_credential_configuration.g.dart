// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_credential_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestedCredentialConfiguration _$RequestedCredentialConfigurationFromJson(
        Map<String, dynamic> json) =>
    RequestedCredentialConfiguration(
      validation: RequestedCredentialValidation.fromJson(
          json['validation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestedCredentialConfigurationToJson(
        RequestedCredentialConfiguration instance) =>
    <String, dynamic>{
      'validation': instance.validation,
    };
