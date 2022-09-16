// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_request_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresentationRequestRequestBody _$PresentationRequestRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PresentationRequestRequestBody(
      includeQRCode: json['includeQRCode'] as bool,
      callback: VerifiedIDRequestCallback.fromJson(
          json['callback'] as Map<String, dynamic>),
      authority: json['authority'] as String,
      registration:
          Registration.fromJson(json['registration'] as Map<String, dynamic>),
      requestedCredentials: (json['requestedCredentials'] as List<dynamic>)
          .map((e) => RequestedCredential.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PresentationRequestRequestBodyToJson(
        PresentationRequestRequestBody instance) =>
    <String, dynamic>{
      'includeQRCode': instance.includeQRCode,
      'callback': instance.callback,
      'authority': instance.authority,
      'registration': instance.registration,
      'requestedCredentials': instance.requestedCredentials,
    };
