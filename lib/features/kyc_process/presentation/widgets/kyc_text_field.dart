import 'package:flutter/material.dart';

class KYCTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const KYCTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
