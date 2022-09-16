// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verified_id_request_callback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifiedIDRequestCallback _$VerifiedIDRequestCallbackFromJson(
        Map<String, dynamic> json) =>
    VerifiedIDRequestCallback(
      url: json['url'] as String,
      state: json['state'] as String,
      headers: json['headers'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$VerifiedIDRequestCallbackToJson(
        VerifiedIDRequestCallback instance) =>
    <String, dynamic>{
      'url': instance.url,
      'state': instance.state,
      'headers': instance.headers,
    };
