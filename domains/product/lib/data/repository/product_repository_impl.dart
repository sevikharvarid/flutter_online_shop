import 'package:common/utils/constants/app_constants.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:product/data/datasource/product_remote_datasource.dart';
import 'package:product/data/mapper/product_mapper.dart';
import 'package:product/domain/entities/response/product_entity.dart';
import 'package:product/domain/entities/response/product_category_entity.dart';
import 'package:product/domain/entities/response/banner_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:product/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDatasource productRemoteDatasource;
  final ProductMapper productMapper;

  const ProductRepositoryImpl({
    required this.productRemoteDatasource,
    required this.productMapper,
  });

  @override
  Future<Either<FailureResponse, ProductDataEntity>> getProduct() async {
    try {
      final response = await productRemoteDatasource.getProduct();
      return Right(
        productMapper.mapProductDataDTOtoProductDataEntity(response.data!),
      );
    } on DioError catch (error) {
      return Left(FailureResponse(
        errorMessage:
            error.response?.data[AppConstants.errorKey.message]?.toString() ??
                error.response.toString(),
      ));
    }
  }

  @override
  Future<Either<FailureResponse, List<ProductCategoryEntity>>>
      getProductCategory() async {
    try {
      final response = await productRemoteDatasource.getProductCategory();
      return Right(
        productMapper.mapProductCategoryDTOtoEntity(response.data!),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, List<BannerDataEntity>>> getBanner() async {
    try {
      final response = await productRemoteDatasource.getBanner();
      return Right(
        productMapper.mapBannerDataDTOtoEntity(response.data!),
      );
    } on DioError catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
        ),
      );
    }
  }
}
