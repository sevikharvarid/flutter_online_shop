import 'package:product/data/model/response/product_response_category_dto.dart';

class ProductResponseDTO {
  bool? status;
  int? code;
  String? message;
  ProductDataDTO? data;

  ProductResponseDTO({this.status, this.code, this.message, this.data});

  ProductResponseDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? new ProductDataDTO.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductDataDTO {
  int? count;
  int? countPerPage;
  int? currentPage;
  List<ProductDTO>? data;

  ProductDataDTO({this.count, this.countPerPage, this.currentPage, this.data});

  ProductDataDTO.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    countPerPage = json['count_per_page'];
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ProductDTO>[];
      json['data'].forEach((v) {
        data!.add(new ProductDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['count_per_page'] = this.countPerPage;
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDTO {
  String? id;
  String? name;
  SellerDTO? seller;
  int? stock;
  ProductCategoryDataDTO? category;
  int? price;
  String? imageUrl;
  String? description;
  int? soldCount;
  double? popularity;

  ProductDTO(
      {this.id,
      this.name,
      this.seller,
      this.stock,
      this.category,
      this.price,
      this.imageUrl,
      this.description,
      this.soldCount,
      this.popularity});

  ProductDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    seller =
        json['seller'] != null ? new SellerDTO.fromJson(json['seller']) : null;
    stock = json['stock'];
    category = json['category'] != null
        ? new ProductCategoryDataDTO.fromJson(json['category'])
        : null;
    price = json['price'];
    imageUrl = json['image_url'];
    description = json['description'];
    soldCount = json['sold_count'];
    popularity = json['popularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    data['stock'] = this.stock;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    data['sold_count'] = this.soldCount;
    data['popularity'] = this.popularity;
    return data;
  }
}

class SellerDTO {
  String? id;
  String? name;
  String? city;

  SellerDTO({this.id, this.name, this.city});

  SellerDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}
