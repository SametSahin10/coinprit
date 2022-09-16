import 'package:coinprit/features/kyc_process/data/models/verified_id_request_callback.dart';
import 'package:coinprit/features/kyc_process/data/models/issuance_request_claims.dart';
import 'package:coinprit/features/kyc_process/data/models/issuance_request_pin.dart';
import 'package:coinprit/features/kyc_process/data/models/registration.dart';
import 'package:json_annotation/json_annotation.dart';

part "issuance_request_request_body.g.dart";

@JsonSerializable()
class IssuanceRequestRequestBody {
  final bool includeQRCode;
  final VerifiedIDRequestCallback callback;
  final String authority;
  final Registration registration;
  final String type;
  final String manifest;
  final IssuanceRequestPin pin;
  final IssuanceRequestClaims claims;

  const IssuanceRequestRequestBody({
    required this.includeQRCode,
    required this.callback,
    required this.authority,
    required this.registration,
    required this.type,
    required this.manifest,
    required this.pin,
    required this.claims,
  });

  Map<String, dynamic> toJson() => _$IssuanceRequestRequestBodyToJson(this);
}
