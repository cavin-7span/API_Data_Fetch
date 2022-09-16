import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/products/mapper/pro_data_entity_mapper.dart';
import 'package:demo_crud/products/model/product_model.dart';
import 'package:demo_crud/products/model/response/character_data_response.dart';

class ProductResponseMapper
    extends BaseMapper<ProductGraphqlResponse, ProductModel> {
  ProductDataEntityMapper productGraphqlEntityMapper =
      ProductDataEntityMapper();

  @override
  ProductModel map(ProductGraphqlResponse t) {
    return ProductModel(
        products: t.productData
            .map((e) => productGraphqlEntityMapper.map(e))
            .toList());
  }
}
