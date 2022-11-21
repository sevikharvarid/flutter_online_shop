class ProductCategoryResponseDTO {
  bool? status;
  int? code;
  String? message;
  List<ProductCategoryDataDTO>? data;

  ProductCategoryResponseDTO({this.status, this.code, this.message, this.data});

  ProductCategoryResponseDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductCategoryDataDTO>[];
      json['data'].forEach((v) {
        data!.add(new ProductCategoryDataDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCategoryDataDTO {
  String? id;
  String? name;
  String? imageCover;
  String? imageIcon;

  ProductCategoryDataDTO({this.id, this.name, this.imageCover, this.imageIcon});

  ProductCategoryDataDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageCover = json['image_cover'];
    imageIcon = json['image_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_cover'] = this.imageCover;
    data['image_icon'] = this.imageIcon;
    return data;
  }
}
