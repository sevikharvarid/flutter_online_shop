import 'package:authentication/data/model/body/auth_request_dto.dart';
import 'package:authentication/data/model/response/auth_response_dto.dart';
import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';

abstract class AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSource();
  Future<AuthResponseDTO> signIn({required AuthRequestDto authRequestDto});
  Future<AuthResponseDTO> signUp({required AuthRequestDto authRequestDto});
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final Dio dio;
  const AuthenticationRemoteDataSourceImpl({required this.dio});
  @override
  Future<AuthResponseDTO> signIn(
      {required AuthRequestDto authRequestDto}) async {
    try {
      final response = await dio.post(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.signIn}",
        data: authRequestDto.toJson(),
      );
      return AuthResponseDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseDTO> signUp(
      {required AuthRequestDto authRequestDto}) async {
    try {
      final response = await dio.post(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.signUp}",
        data: authRequestDto.toJson(),
      );
      return AuthResponseDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
