import 'package:coinprit/features/kyc_process/data/models/requested_credential_validation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'requested_credential_configuration.g.dart';

@JsonSerializable()
class RequestedCredentialConfiguration {
  final RequestedCredentialValidation validation;

  const RequestedCredentialConfiguration({required this.validation});

  factory RequestedCredentialConfiguration.fromJson(Map<String, dynamic> json) {
    return _$RequestedCredentialConfigurationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestedCredentialConfigurationToJson(this);
  }
}
