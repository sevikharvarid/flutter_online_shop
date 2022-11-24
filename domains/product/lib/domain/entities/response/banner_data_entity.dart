class BannerDataEntity {
  String? id;
  String? name;
  String? headline;
  String? caption;
  String? imageUrl;
  String? sellerId;
  String? productId;

  BannerDataEntity(
      {required this.id,
      required this.name,
      required this.headline,
      required this.caption,
      required this.imageUrl,
      required this.sellerId,
      required this.productId});
}
