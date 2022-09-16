import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void hideDialog() => Navigator.of(this).pop();

  void showProgressDialog({required String text}) {
    showDialog<void>(
      context: this,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            title: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            content: Container(
              alignment: Alignment.center,
              width: 60,
              height: 60,
              child: const CircularProgressIndicator(),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        );
      },
    );
  }
}
