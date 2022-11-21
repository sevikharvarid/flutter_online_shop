import 'package:product/data/model/response/banner_response_dto.dart';
import 'package:product/data/model/response/product_response_category_dto.dart';
import 'package:product/data/model/response/product_response_dto.dart';
import 'package:product/domain/response/banner_data_entity.dart';
import 'package:product/domain/response/product_category_entity.dart';
import 'package:product/domain/response/product_entity.dart';

class ProductMapper {
  List<ProductCategoryEntity> mapProductCategoryDTOtoEntity(
      List<ProductCategoryDataDTO> data) {
    List<ProductCategoryEntity> entity = <ProductCategoryEntity>[];

    for (ProductCategoryDataDTO element in data) {
      entity.add(
        mapProductCategoryDataDTOtoProductCategoryEntity(
          element,
        ),
      );
    }
    return entity;
  }

  ProductCategoryEntity mapProductCategoryDataDTOtoProductCategoryEntity(
          ProductCategoryDataDTO dataDTO) =>
      ProductCategoryEntity(
          id: dataDTO.id ?? "",
          name: dataDTO.name ?? "",
          imageCover: dataDTO.imageCover ?? "",
          imageIcon: dataDTO.imageIcon ?? "");

  ProductDataEntity mapProductDataDTOtoProductDataEntity(ProductDataDTO data) =>
      ProductDataEntity(
        count: data.count ?? 0,
        countPerPage: data.countPerPage ?? 0,
        currentPage: data.currentPage ?? 0,
        data: mapProductDataDTOtoProductEntity(
          data.data ?? [],
        ),
      );

  List<ProductEntity> mapProductDataDTOtoProductEntity(List<ProductDTO> data) {
    List<ProductEntity> entity = <ProductEntity>[];

    for (ProductDTO element in data) {
      entity.add(
        mapProductDTOtoProductEntity(
          element,
        ),
      );
    }
    return entity;
  }

  ProductEntity mapProductDTOtoProductEntity(ProductDTO data) => ProductEntity(
        id: data.id ?? "",
        name: data.name ?? "",
        seller: mapSellerDTOtoSellerEntity(
          data.seller ?? SellerDTO(),
        ),
        stock: data.stock ?? 0,
        category: mapProductCategoryDataDTOtoProductCategoryEntity(
          data.category ?? ProductCategoryDataDTO(),
        ),
        price: data.price,
        imageUrl: data.imageUrl ?? "",
        description: data.description ?? "",
        soldCount: data.soldCount ?? 0,
        popularity: data.popularity ?? 0.0,
      );

  SellerEntity mapSellerDTOtoSellerEntity(SellerDTO data) => SellerEntity(
        id: data.id ?? "",
        name: data.name ?? "",
        city: data.city ?? "",
      );

  List<BannerDataEntity> mapBannerDataDTOtoEntity(List<BannerDataDTO> data) {
    List<BannerDataEntity> dataEntity = <BannerDataEntity>[];

    for (BannerDataDTO element in data) {
      dataEntity.add(
        mapBannerDataDTOtoBannerEntity(
          element,
        ),
      );
    }
    return dataEntity;
  }

  BannerDataEntity mapBannerDataDTOtoBannerEntity(
          BannerDataDTO bannerDataDTO) =>
      BannerDataEntity(
          id: bannerDataDTO.id ?? "",
          name: bannerDataDTO.name ?? "",
          headline: bannerDataDTO.headline ?? "",
          caption: bannerDataDTO.caption ?? "",
          imageUrl: bannerDataDTO.imageUrl ?? "",
          sellerId: bannerDataDTO.sellerId ?? "",
          productId: bannerDataDTO.productId ?? "");
}
