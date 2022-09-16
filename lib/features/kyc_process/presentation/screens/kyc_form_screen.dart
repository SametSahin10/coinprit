import 'package:flutter/material.dart';
import 'package:coinprit/features/kyc_process/presentation/widgets/kyc_text_fields.dart';
import 'package:coinprit/features/kyc_process/presentation/widgets/submit_kyc_form_button.dart';

class KycFormScreen extends StatelessWidget {
  const KycFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "KYC Form",
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 20),
            Text(
              "Complete the form below to start the KYC process",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            KYCTextFields(),
            SizedBox(height: 60),
            SubmitKYCFormButton(),
          ],
        ),
      ),
    );
  }
}
