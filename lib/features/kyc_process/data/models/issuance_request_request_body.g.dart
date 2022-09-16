// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issuance_request_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssuanceRequestRequestBody _$IssuanceRequestRequestBodyFromJson(
        Map<String, dynamic> json) =>
    IssuanceRequestRequestBody(
      includeQRCode: json['includeQRCode'] as bool,
      callback: VerifiedIDRequestCallback.fromJson(
          json['callback'] as Map<String, dynamic>),
      authority: json['authority'] as String,
      registration:
          Registration.fromJson(json['registration'] as Map<String, dynamic>),
      type: json['type'] as String,
      manifest: json['manifest'] as String,
      pin: IssuanceRequestPin.fromJson(json['pin'] as Map<String, dynamic>),
      claims: IssuanceRequestClaims.fromJson(
          json['claims'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IssuanceRequestRequestBodyToJson(
        IssuanceRequestRequestBody instance) =>
    <String, dynamic>{
      'includeQRCode': instance.includeQRCode,
      'callback': instance.callback,
      'authority': instance.authority,
      'registration': instance.registration,
      'type': instance.type,
      'manifest': instance.manifest,
      'pin': instance.pin,
      'claims': instance.claims,
    };
