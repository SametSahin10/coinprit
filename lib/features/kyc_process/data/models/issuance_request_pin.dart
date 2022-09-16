import 'package:json_annotation/json_annotation.dart';

part 'issuance_request_pin.g.dart';

@JsonSerializable()
class IssuanceRequestPin {
  final String value;
  final int length;

  const IssuanceRequestPin({required this.value, required this.length});

  factory IssuanceRequestPin.fromJson(Map<String, dynamic> json) {
    return _$IssuanceRequestPinFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IssuanceRequestPinToJson(this);
}
