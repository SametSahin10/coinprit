import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coinprit/features/kyc_process/presentation/state_management/kyc_form_screen_model.dart';

final kycFormScreenModelProvider = ChangeNotifierProvider(
  (_) => KYCFormScreenModel(),
);
