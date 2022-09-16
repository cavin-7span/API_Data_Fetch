import 'package:demo_crud/base/base_ui_state.dart';
import 'package:demo_crud/products/model/product_model.dart';

class ProductState extends BaseUiState<ProductModel> {
  ProductState.loading() : super.loading();

  ProductState.completed(ProductModel data) : super.completed(data: data);

  ProductState.error(dynamic error) : super.error(error);
}
