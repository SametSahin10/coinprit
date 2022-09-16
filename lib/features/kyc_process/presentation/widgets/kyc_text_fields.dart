import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coinprit/features/kyc_process/presentation/state_management/providers.dart';
import 'package:coinprit/features/kyc_process/presentation/widgets/kyc_text_field.dart';

class KYCTextFields extends ConsumerWidget {
  const KYCTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kycFormScreenModel = ref.watch(kycFormScreenModelProvider);
    final firstNameTextController = kycFormScreenModel.firstNameTextController;
    final lastNameTextController = kycFormScreenModel.lastNameTextController;
    return Column(
      children: [
        KYCTextField(
          controller: firstNameTextController,
          hintText: "First name",
        ),
        const SizedBox(height: 20),
        KYCTextField(
          controller: lastNameTextController,
          hintText: "Last name",
        ),
      ],
    );
  }
}
