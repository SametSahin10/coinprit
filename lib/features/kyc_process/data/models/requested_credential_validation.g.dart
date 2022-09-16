// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_credential_validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestedCredentialValidation _$RequestedCredentialValidationFromJson(
        Map<String, dynamic> json) =>
    RequestedCredentialValidation(
      allowRevoked: json['allowRevoked'] as bool,
      validateLinkedDomain: json['validateLinkedDomain'] as bool,
    );

Map<String, dynamic> _$RequestedCredentialValidationToJson(
        RequestedCredentialValidation instance) =>
    <String, dynamic>{
      'allowRevoked': instance.allowRevoked,
      'validateLinkedDomain': instance.validateLinkedDomain,
    };
