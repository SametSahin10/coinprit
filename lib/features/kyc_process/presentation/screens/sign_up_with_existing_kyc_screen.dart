import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWithExistingKYCScreen extends StatelessWidget {
  final String state;
  final String rawQRCode;

  const SignUpWithExistingKYCScreen({
    super.key,
    required this.state,
    required this.rawQRCode,
  });

  @override
  Widget build(BuildContext context) {
    final qrCodeInBase64 = rawQRCode.split(",")[1];
    var qrCodeInBytes = base64Decode(qrCodeInBase64);
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("presentationResults")
              .where("state", isEqualTo: state)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final querySnapshot = snapshot.data;

            if (querySnapshot == null || querySnapshot.docs.isEmpty) {
              return _QRCodeWidget(qrCodeInBytes: qrCodeInBytes);
            }

            final docSnapshot = querySnapshot.docs.first;
            final docData = docSnapshot.data();

            final requestStatus = docData["requestStatus"] as String?;

            if (requestStatus == "presentation_verified") {
              final verifiedCredentialsData =
                  docData["verifiedCredentialsData"] as List<dynamic>;
              final verifiedCredentialData = verifiedCredentialsData.first;

              final issuer = verifiedCredentialData["issuer"];

              final claims =
                  verifiedCredentialData["claims"] as Map<String, dynamic>;
              final firstName = claims["firstName"];
              final lastName = claims["lastName"];

              return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "We have verified that your are ",
                  style: TextStyle(
                    fontFamily: GoogleFonts.dosis().fontFamily,
                    fontSize: 24,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: firstName + " " + lastName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const TextSpan(text: "."),
                    const TextSpan(
                      text: "\nThe issuer who issued the "
                          "Verifiable Credential of KYC: ",
                    ),
                    TextSpan(
                      text: issuer,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            }

            return _QRCodeWidget(qrCodeInBytes: qrCodeInBytes);
          },
        ),
      ),
    );
  }
}

class _QRCodeWidget extends StatelessWidget {
  final Uint8List qrCodeInBytes;

  const _QRCodeWidget({
    Key? key,
    required this.qrCodeInBytes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Scan the QR code below to sign in with existing KYC.",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        const Text(
          "We will verify that you've gone through the KYC process of Fuse.",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Image.memory(qrCodeInBytes),
      ],
    );
  }
}
