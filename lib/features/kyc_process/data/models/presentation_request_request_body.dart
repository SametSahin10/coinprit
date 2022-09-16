import 'package:coinprit/features/kyc_process/data/models/registration.dart';
import 'package:coinprit/features/kyc_process/data/models/requested_credential.dart';
import 'package:coinprit/features/kyc_process/data/models/verified_id_request_callback.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentation_request_request_body.g.dart';

@JsonSerializable()
class PresentationRequestRequestBody {
  final bool includeQRCode;
  final VerifiedIDRequestCallback callback;
  final String authority;
  final Registration registration;
  final List<RequestedCredential> requestedCredentials;

  const PresentationRequestRequestBody({
    required this.includeQRCode,
    required this.callback,
    required this.authority,
    required this.registration,
    required this.requestedCredentials,
  });

  Map<String, dynamic> toJson() => _$PresentationRequestRequestBodyToJson(this);
}
