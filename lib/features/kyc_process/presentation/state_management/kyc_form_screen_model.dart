import 'package:flutter/material.dart';

class KYCFormScreenModel extends ChangeNotifier {
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();

  KYCFormScreenModel() {
    firstNameTextController.addListener(() {
      _firstName = firstNameTextController.text;
      notifyListeners();
    });

    lastNameTextController.addListener(() {
      _lastName = lastNameTextController.text;
      notifyListeners();
    });
  }

  String? _firstName;
  String? _lastName;

  // Getters
  bool get isSubmitButtonEnabled {
    final firstNameExists = _firstName != null && _firstName!.isNotEmpty;
    final lastNameExists = _lastName != null && _lastName!.isNotEmpty;
    return firstNameExists && lastNameExists;
  }
}
