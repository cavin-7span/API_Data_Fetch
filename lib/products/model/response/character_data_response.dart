import 'package:demo_crud/products/model/entity/product_data_entity.dart';

class ProductGraphqlResponse {
  List<ProductDataEntity> productData = [];
  int? page;
  bool? hasMoreData;

  ProductGraphqlResponse.fromJson(Map<String, dynamic> map, {int? page}) {
    final json = map["products"];
    final productDataJson = json["data"];

    if (productDataJson != null && productDataJson is List) {
      productData.addAll(
          productDataJson.map((e) => ProductDataEntity.fromJson(e)).toList());
    }

    final paginationJson = map['pagination'];
    if (paginationJson != null) {
      hasMoreData = paginationJson['hasMorePages'] ?? true;
      this.page = page;
    }
  }
}
