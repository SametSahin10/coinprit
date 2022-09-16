import 'package:coinprit/features/kyc_process/data/data_sources/auth_local_data_source.dart';
import 'package:coinprit/features/kyc_process/data/data_sources/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  Future<String> getAccessToken() async {
    final localAccessToken = authLocalDataSource.getAccessToken();
    if (localAccessToken != null) return localAccessToken;
    return refreshAccessToken();
  }

  Future<String> refreshAccessToken() async {
    final accessToken = await authRemoteDataSource.getAccessToken();
    await authLocalDataSource.saveAccessToken(accessToken);
    return accessToken;
  }
}
