import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:product/domain/entities/response/product_category_entity.dart';

class ProductCategoryState extends Equatable {
  final ViewData<List<ProductCategoryEntity>> productCategoryState;

  ProductCategoryState({required this.productCategoryState});

  ProductCategoryState copyWith(
      {ViewData<List<ProductCategoryEntity>>? productCategoryState}) {
    return ProductCategoryState(
      productCategoryState: productCategoryState ?? this.productCategoryState,
    );
  }

  @override
  List<Object?> get props => [productCategoryState];
}
