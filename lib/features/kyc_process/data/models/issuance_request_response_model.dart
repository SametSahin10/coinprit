import 'package:json_annotation/json_annotation.dart';

part 'issuance_request_response_model.g.dart';

@JsonSerializable()
class IssuanceRequestResponseModel {
  @JsonKey(name: "qrCode")
  final String rawQRCode;

  const IssuanceRequestResponseModel({required this.rawQRCode});

  factory IssuanceRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return _$IssuanceRequestResponseModelFromJson(json);
  }
}
