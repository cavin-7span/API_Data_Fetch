import 'package:demo_crud/graphql/app_graphql_client.dart';
import 'package:demo_crud/products/model/response/character_data_response.dart';
import 'package:demo_crud/products/source/product_graphql_request.dart';

class ProductGraphqlSource {
  final AppGraphQlClient? appGraphQlClient;

  ProductGraphqlSource({this.appGraphQlClient});

  Stream<ProductGraphqlResponse> getProducts() {
    return appGraphQlClient!.queryString(ProductGraphqlRequest.getProducts).map(
          (response) => ProductGraphqlResponse.fromJson(response!),
        );
  }
}
