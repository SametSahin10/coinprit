import 'dart:convert';

import 'package:flutter/material.dart';

class InitiateVCIssuanceScreen extends StatelessWidget {
  final String rawQRCode;
  final String pin;

  const InitiateVCIssuanceScreen({
    Key? key,
    required this.rawQRCode,
    required this.pin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrCodeInBase64 = rawQRCode.split(",")[1];
    var qrCodeInBytes = base64Decode(qrCodeInBase64);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scan the QR code below to initiate "
              "the issuance of your Verifiable Credential.",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Image.memory(qrCodeInBytes),
            const SizedBox(height: 20),
            Text("PIN: $pin", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
