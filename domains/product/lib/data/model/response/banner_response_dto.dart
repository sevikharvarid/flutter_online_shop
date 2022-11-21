class BannerResponseDTO {
  bool? status;
  int? code;
  String? message;
  List<BannerDataDTO>? data;

  BannerResponseDTO({this.status, this.code, this.message, this.data});

  BannerResponseDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BannerDataDTO>[];
      json['data'].forEach((v) {
        data!.add(new BannerDataDTO.fromJson(v));
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

class BannerDataDTO {
  String? id;
  String? name;
  String? headline;
  String? caption;
  String? imageUrl;
  String? sellerId;
  String? productId;

  BannerDataDTO(
      {this.id,
      this.name,
      this.headline,
      this.caption,
      this.imageUrl,
      this.sellerId,
      this.productId});

  BannerDataDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    headline = json['headline'];
    caption = json['caption'];
    imageUrl = json['image_url'];
    sellerId = json['seller_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['headline'] = this.headline;
    data['caption'] = this.caption;
    data['image_url'] = this.imageUrl;
    data['seller_id'] = this.sellerId;
    data['product_id'] = this.productId;
    return data;
  }
}
