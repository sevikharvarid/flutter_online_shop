import 'package:common/utils/error/exception.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';
import 'package:common/utils/constants/app_constants.dart';

abstract class AuthenticationLocalDataSource {
  const AuthenticationLocalDataSource();

  Future<bool> cacheOnBoarding();
  Future<bool> getCacheOnBoardingStatus();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final SharedPreferences sharedPreferences;

  const AuthenticationLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> cacheOnBoarding() async => await sharedPreferences.setBool(
      AppConstants.cachedKey.onBoardingKey, true);

  @override
  Future<bool> getCacheOnBoardingStatus() async {
    try {
      return sharedPreferences.getBool(AppConstants.cachedKey.onBoardingKey) ??
          false;
    } catch (_) {
      throw DatabaseException(AppConstants.errorMessage.failedGetOnBoarding);
    }
  }
}
