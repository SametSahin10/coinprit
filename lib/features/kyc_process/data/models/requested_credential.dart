import 'package:coinprit/features/kyc_process/data/models/requested_credential_configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'requested_credential.g.dart';

@JsonSerializable()
class RequestedCredential {
  final String type;
  final String purpose;
  final List<String> acceptedIssuers;
  final RequestedCredentialConfiguration configuration;

  const RequestedCredential({
    required this.type,
    required this.purpose,
    required this.acceptedIssuers,
    required this.configuration,
  });

  factory RequestedCredential.fromJson(Map<String, dynamic> json) {
    return _$RequestedCredentialFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestedCredentialToJson(this);
}
