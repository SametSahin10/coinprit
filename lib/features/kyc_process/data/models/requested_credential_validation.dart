import 'package:json_annotation/json_annotation.dart';

part 'requested_credential_validation.g.dart';

@JsonSerializable()
class RequestedCredentialValidation {
  final bool allowRevoked;
  final bool validateLinkedDomain;

  const RequestedCredentialValidation({
    required this.allowRevoked,
    required this.validateLinkedDomain,
  });

  factory RequestedCredentialValidation.fromJson(Map<String, dynamic> json) {
    return _$RequestedCredentialValidationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestedCredentialValidationToJson(this);
}
