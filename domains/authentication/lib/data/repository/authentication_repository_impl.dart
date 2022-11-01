import 'package:authentication/data/datasource/local/authentication_local_datasource.dart';
import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationLocalDataSource,
  });

  @override
  Future<Either<FailureResponse, bool>> cacheOnBoarding() async {
    try {
      await authenticationLocalDataSource.cacheOnBoarding();
      return const Right(true);
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, bool>> onGetOnBoardingStatus() async {
    try {
      final response =
          await authenticationLocalDataSource.getCacheOnBoardingStatus();
      return Right(true);
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }
}
