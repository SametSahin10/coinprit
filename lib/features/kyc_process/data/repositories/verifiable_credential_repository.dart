import 'dart:convert';

import 'package:coinprit/core/constants.dart';
import 'package:coinprit/features/kyc_process/data/models/presentation_request_request_body.dart';
import 'package:coinprit/features/kyc_process/data/models/presentation_request_response_model.dart';
import 'package:coinprit/features/kyc_process/data/models/requested_credential.dart';
import 'package:coinprit/features/kyc_process/data/models/requested_credential_configuration.dart';
import 'package:coinprit/features/kyc_process/data/models/requested_credential_validation.dart';
import 'package:coinprit/features/kyc_process/data/models/verified_id_request_callback.dart';
import 'package:coinprit/features/kyc_process/data/models/issuance_request_claims.dart';
import 'package:coinprit/features/kyc_process/data/models/issuance_request_pin.dart';
import 'package:coinprit/features/kyc_process/data/models/issuance_request_request_body.dart';
import 'package:coinprit/features/kyc_process/data/models/issuance_request_response_model.dart';
import 'package:coinprit/features/kyc_process/data/models/registration.dart';
import 'package:coinprit/features/kyc_process/data/repositories/auth_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class VerifiableCredentialRepository {
  final AuthRepository authRepository;

  const VerifiableCredentialRepository({required this.authRepository});

  Future<IssuanceRequestResponseModel> createIssuanceRequest({
    required String firstName,
    required String lastName,
    required IssuanceRequestPin pin,
  }) async {
    final accessToken = await authRepository.getAccessToken();

    final issuanceRequestRequestBody = _createIssuanceRequestRequestBody(
      firstName: firstName,
      lastName: lastName,
      pin: pin,
    );
    final requestBody = jsonEncode(issuanceRequestRequestBody);

    final response = await http.post(
      Uri.parse(createIssuanceRequestURL),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
      },
      body: requestBody,
    );

    if (response.statusCode == 401) {
      await authRepository.refreshAccessToken();
      return createIssuanceRequest(
        firstName: firstName,
        lastName: lastName,
        pin: pin,
      );
    }

    if (response.statusCode == 201) {
      final decodedResponse = jsonDecode(response.body);
      return IssuanceRequestResponseModel.fromJson(decodedResponse);
    } else {
      throw Exception("Failed to create issuance request. ${response.body}");
    }
  }

  Future<PresentationRequestResponseModel> createPresentationRequest({
    required String state,
  }) async {
    final accessToken = await authRepository.getAccessToken();

    final presentationRequestRequestBody =
        _createPresentationRequestRequestBody(state: state);
    final requestBody = jsonEncode(presentationRequestRequestBody);

    final url = Uri.parse(createPresentationRequestURL);

    final response = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
      },
      body: requestBody,
    );

    if (response.statusCode == 401) {
      await authRepository.refreshAccessToken();
      return createPresentationRequest(state: state);
    }

    if (response.statusCode == 201) {
      final decodedResponse = jsonDecode(response.body);
      return PresentationRequestResponseModel.fromJson(decodedResponse);
    } else {
      throw Exception(
        "Failed to create presentation request. ${response.body}",
      );
    }
  }

  PresentationRequestRequestBody _createPresentationRequestRequestBody({
    required String state,
  }) {
    final headers = <String, dynamic>{
      "api-key": "API for ISSUER CALLBACK API",
    };

    final callback = VerifiedIDRequestCallback(
      url: presentationRequestCallback,
      state: state,
      headers: headers,
    );

    const registration = Registration(clientName: "Coinprit");

    final requestedCredential = _createRequestedCredential();
    final requestedCredentials = <RequestedCredential>[requestedCredential];

    return PresentationRequestRequestBody(
      includeQRCode: true,
      callback: callback,
      authority: verifiedIDRequestAuthority,
      registration: registration,
      requestedCredentials: requestedCredentials,
    );
  }

  RequestedCredential _createRequestedCredential() {
    const validation = RequestedCredentialValidation(
      allowRevoked: true,
      validateLinkedDomain: true,
    );

    const configuration =
        RequestedCredentialConfiguration(validation: validation);

    return const RequestedCredential(
      type: "KYC",
      purpose: "So that we know you are a trusted user",
      // TODO: Add the DID of Fuse KYC Service later.
      acceptedIssuers: <String>[],
      configuration: configuration,
    );
  }

  IssuanceRequestRequestBody _createIssuanceRequestRequestBody({
    required String firstName,
    required String lastName,
    required IssuanceRequestPin pin,
  }) {
    final state = const Uuid().v1();
    final headers = <String, dynamic>{
      "api-key": "API for ISSUER CALLBACK API",
    };

    final callback = VerifiedIDRequestCallback(
      url: issuanceRequestCallback,
      state: state,
      headers: headers,
    );

    const registration = Registration(clientName: "Coinprit");

    final claims =
        IssuanceRequestClaims(firstName: firstName, lastName: lastName);

    return IssuanceRequestRequestBody(
      includeQRCode: true,
      callback: callback,
      authority: verifiedIDRequestAuthority,
      registration: registration,
      type: verifiableCredentialType,
      manifest: issuanceRequestManifest,
      pin: pin,
      claims: claims,
    );
  }
}
