import 'dart:math';

import 'package:coinprit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coinprit/core/extensions.dart';
import 'package:coinprit/core/navigation.dart';
import 'package:coinprit/features/kyc_process/data/models/issuance_request_pin.dart';
import 'package:coinprit/features/kyc_process/data/repositories/verifiable_credential_repository.dart';
import 'package:coinprit/features/kyc_process/presentation/state_management/providers.dart';

class SubmitKYCFormButton extends ConsumerWidget {
  const SubmitKYCFormButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kycFormScreenModel = ref.watch(kycFormScreenModelProvider);
    final isSubmitButtonEnabled = kycFormScreenModel.isSubmitButtonEnabled;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor:
            isSubmitButtonEnabled ? Colors.blue : Colors.blue.withOpacity(0.5),
        padding: const EdgeInsets.all(24),
      ),
      child: const Text(
        "Submit",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      onPressed: () async {
        if (!isSubmitButtonEnabled) return;

        final firstName = kycFormScreenModel.firstNameTextController.text;
        final lastName = kycFormScreenModel.lastNameTextController.text;

        final repository = getIt<VerifiableCredentialRepository>();

        context.showProgressDialog(text: "Submitting KYC...");
        final navigator = Navigator.of(context);

        final pin = _generateRandomPin();
        final issuanceRequestPin = IssuanceRequestPin(length: 4, value: pin);

        final responseModel = await repository.createIssuanceRequest(
          firstName: firstName,
          lastName: lastName,
          pin: issuanceRequestPin,
        );

        navigator.pop();

        final rawQRCode = responseModel.rawQRCode;
        pushInitiateVCIssuanceScreen(
          context: context,
          rawQRCode: rawQRCode,
          pin: pin,
        );
      },
    );
  }

  String _generateRandomPin() {
    final random = Random();
    String pinAsString = "";

    for (int i = 0; i < 4; i++) {
      var randomNumber = random.nextInt(10);
      pinAsString += randomNumber.toString();
    }

    return pinAsString;
  }
}
