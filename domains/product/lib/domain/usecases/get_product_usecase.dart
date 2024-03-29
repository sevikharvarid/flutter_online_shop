import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/response/product_entity.dart';
import 'package:product/domain/repository/product_repository.dart';

class GetProductUseCase extends UseCase<ProductDataEntity, NoParams> {
  final ProductRepository productRepository;

  GetProductUseCase({required this.productRepository});

  @override
  Future<Either<FailureResponse, ProductDataEntity>> call(
          NoParams params) async =>
      productRepository.getProduct();
}
