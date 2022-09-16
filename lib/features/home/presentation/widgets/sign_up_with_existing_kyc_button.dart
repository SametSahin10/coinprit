import 'package:coinprit/core/extensions.dart';
import 'package:coinprit/core/navigation.dart';
import 'package:coinprit/features/kyc_process/data/repositories/verifiable_credential_repository.dart';
import 'package:coinprit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SignUpWithExistingKYCButton extends StatelessWidget {
  const SignUpWithExistingKYCButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(24),
        ),
        child: const Text(
          "Sign up with existing KYC",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        onPressed: () async {
          final repository = getIt<VerifiableCredentialRepository>();

          context.showProgressDialog(text: "Creating QR code...");
          final navigator = Navigator.of(context);

          final state = const Uuid().v1();

          final responseModel =
              await repository.createPresentationRequest(state: state);
          navigator.pop();

          final rawQRCode = responseModel.rawQRCode;
          pushSignUpWithExistingKYCScreen(
            context: context,
            rawQRCode: rawQRCode,
            state: state,
          );
        },
      ),
    );
  }
}
