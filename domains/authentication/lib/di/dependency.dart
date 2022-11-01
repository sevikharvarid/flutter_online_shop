import 'package:authentication/data/datasource/local/authentication_local_datasource.dart';
import 'package:authentication/data/repository/authentication_repository_impl.dart';
import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:authentication/domain/usecases/cache_onboarding_usecase.dart';
import 'package:authentication/domain/usecases/get_onboarding_status_usecase.dart';
import 'package:dependencies/get_it/get_it.dart';

class AuthenticationDependency {
  AuthenticationDependency() {
    _registerDataSource();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSource() {
    sl.registerSingleton<AuthenticationLocalDataSource>(
      AuthenticationLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(
        authenticationLocalDataSource: sl(),
      ),
    );
  }

  void _registerUseCases() {
    sl.registerSingleton<CacheOnboardingUseCase>(
      CacheOnboardingUseCase(
        authenticationRepository: sl(),
      ),
    );
    sl.registerSingleton<GetOnboardingStatusUseCase>(
      GetOnboardingStatusUseCase(
        authenticationRepository: sl(),
      ),
    );
  }
}
