import 'package:coinprit/features/home/presentation/widgets/sign_up_with_existing_kyc_button.dart';
import 'package:flutter/material.dart';
import 'package:coinprit/features/home/presentation/widgets/sign_up_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Coinprit",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 60),
            SignUpButton(),
            SizedBox(height: 30),
            SignUpWithExistingKYCButton(),
          ],
        ),
      ),
    );
  }
}
