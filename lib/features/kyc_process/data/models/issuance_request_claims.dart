import 'package:json_annotation/json_annotation.dart';

part 'issuance_request_claims.g.dart';

@JsonSerializable()
class IssuanceRequestClaims {
  @JsonKey(name: "given_name")
  final String firstName;

  @JsonKey(name: "family_name")
  final String lastName;

  const IssuanceRequestClaims({
    required this.firstName,
    required this.lastName,
  });

  factory IssuanceRequestClaims.fromJson(Map<String, dynamic> json) {
    return _$IssuanceRequestClaimsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IssuanceRequestClaimsToJson(this);
}
