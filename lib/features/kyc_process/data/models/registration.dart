import 'package:json_annotation/json_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration {
  final String clientName;

  const Registration({required this.clientName});

  factory Registration.fromJson(Map<String, dynamic> json) {
    return _$RegistrationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);
}
