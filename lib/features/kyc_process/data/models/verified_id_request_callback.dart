import 'package:json_annotation/json_annotation.dart';

part 'verified_id_request_callback.g.dart';

@JsonSerializable()
class VerifiedIDRequestCallback {
  final String url;
  final String state;
  final Map<String, dynamic> headers;

  const VerifiedIDRequestCallback({
    required this.url,
    required this.state,
    required this.headers,
  });

  factory VerifiedIDRequestCallback.fromJson(Map<String, dynamic> json) {
    return _$VerifiedIDRequestCallbackFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifiedIDRequestCallbackToJson(this);
}
