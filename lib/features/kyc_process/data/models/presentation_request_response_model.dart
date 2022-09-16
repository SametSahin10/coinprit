import 'package:json_annotation/json_annotation.dart';

part 'presentation_request_response_model.g.dart';

@JsonSerializable()
class PresentationRequestResponseModel {
  @JsonKey(name: "qrCode")
  final String rawQRCode;

  const PresentationRequestResponseModel({required this.rawQRCode});

  factory PresentationRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PresentationRequestResponseModelFromJson(json);
  }
}
