import 'package:demo_crud/products/mapper/product_response_mapper.dart';
import 'package:demo_crud/products/model/product_model.dart';
import 'package:demo_crud/products/source/product_graphql_source.dart';

class ProductRepository {
  ProductGraphqlSource? productGraphqlSource;
  ProductResponseMapper? productResponseMapper;

  ProductRepository({this.productResponseMapper, this.productGraphqlSource});

  Stream<ProductModel> getProducts() {
    return productGraphqlSource!.getProducts().map(
          (response) => productResponseMapper!.map(response),
        );
  }
}
