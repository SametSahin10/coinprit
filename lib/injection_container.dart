import 'package:coinprit/features/kyc_process/data/data_sources/auth_local_data_source.dart';
import 'package:coinprit/features/kyc_process/data/data_sources/auth_remote_data_source.dart';
import 'package:coinprit/features/kyc_process/data/repositories/auth_repository.dart';
import 'package:coinprit/features/kyc_process/data/repositories/verifiable_credential_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  // Repositories
  getIt.registerLazySingleton(
    () {
      return AuthRepository(
        authRemoteDataSource: getIt(),
        authLocalDataSource: getIt(),
      );
    },
  );

  getIt.registerLazySingleton(
    () => VerifiableCredentialRepository(authRepository: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton(() => AuthRemoteDataSource());

  getIt.registerLazySingleton(
    () => AuthLocalDataSource(sharedPreferences: getIt()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(sharedPreferences);
}
