import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:product/data/model/response/banner_response_dto.dart';
import 'package:product/data/model/response/product_response_category_dto.dart';
import 'package:product/data/model/response/product_response_dto.dart';

abstract class ProductRemoteDatasource {
  const ProductRemoteDatasource();

  Future<ProductCategoryResponseDTO> getProductCategory();
  Future<ProductResponseDTO> getProduct();
  Future<BannerResponseDTO> getBanner();
}

class ProductRemoteDatasourceImpl extends ProductRemoteDatasource {
  final Dio dio;

  const ProductRemoteDatasourceImpl({required this.dio});

  @override
  Future<BannerResponseDTO> getBanner() async {
    try {
      final response = await dio
          .post("${AppConstants.appApi.baseUrl}${AppConstants.appApi.banner}");
      return BannerResponseDTO.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ProductResponseDTO> getProduct() async {
    try {
      final response = await dio
          .get("${AppConstants.appApi.baseUrl}${AppConstants.appApi.product}");
      return ProductResponseDTO.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ProductCategoryResponseDTO> getProductCategory() async {
    try {
      final response = await dio
          .get("${AppConstants.appApi.baseUrl}${AppConstants.appApi.category}");
      return ProductCategoryResponseDTO.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
