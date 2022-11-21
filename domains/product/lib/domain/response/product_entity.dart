import 'package:product/data/model/response/product_response_category_dto.dart';
import 'package:product/domain/response/product_category_entity.dart';

class ProductResponseDTO {
  bool? status;
  int? code;
  String? message;
  ProductDataEntity? data;
  ProductResponseDTO({this.status, this.code, this.message, this.data});
}

class ProductDataEntity {
  int? count;
  int? countPerPage;
  int? currentPage;
  List<ProductEntity>? data;

  ProductDataEntity(
      {required this.count,
      required this.countPerPage,
      required this.currentPage,
      required this.data});
}

class ProductEntity {
  String? id;
  String? name;
  SellerEntity? seller;
  int? stock;
  ProductCategoryEntity? category;
  int? price;
  String? imageUrl;
  String? description;
  int? soldCount;
  double? popularity;

  ProductEntity(
      {required this.id,
      required this.name,
      required this.seller,
      required this.stock,
      required this.category,
      required this.price,
      required this.imageUrl,
      required this.description,
      required this.soldCount,
      required this.popularity});
}

class SellerEntity {
  String? id;
  String? name;
  String? city;

  SellerEntity({
    required this.id,
    required this.name,
    required this.city,
  });
}
