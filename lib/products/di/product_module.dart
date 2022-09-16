import 'package:demo_crud/graphql/app_graphql_client.dart';
import 'package:demo_crud/products/bloc/product_bloc.dart';
import 'package:demo_crud/products/mapper/product_response_mapper.dart';
import 'package:demo_crud/products/repo/product_repo.dart';
import 'package:demo_crud/products/source/product_graphql_source.dart';

class ProductModule {
  static final _instance = ProductModule._internal();

  ProductModule._internal();

  factory ProductModule() {
    return _instance;
  }

  ProductBloc getProductBloc() {
    return ProductBloc(
      ProductModule().getProductRepo(),
    );
  }

  ProductRepository getProductRepo() {
    return ProductRepository(
      productGraphqlSource: ProductGraphqlSource(
        appGraphQlClient:
            AppGraphQlClient("https://api.vepaar.dev/graphql/open"),
      ),
      productResponseMapper: ProductResponseMapper(),
    );
  }
}
