import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/response/product_category_entity.dart';
import 'package:product/domain/repository/product_repository.dart';

class GetProductCategoryUseCase
    extends UseCase<List<ProductCategoryEntity>, NoParams> {
  final ProductRepository productRepository;

  GetProductCategoryUseCase({
    required this.productRepository,
  });
  @override
  Future<Either<FailureResponse, List<ProductCategoryEntity>>> call(
          NoParams params) async =>
      await productRepository.getProductCategory();
}
