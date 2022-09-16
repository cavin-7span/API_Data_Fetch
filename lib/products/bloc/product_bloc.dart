import 'dart:async';

import 'package:demo_crud/base/base_bloc.dart';
import 'package:demo_crud/products/model/product_data_model.dart';
import 'package:demo_crud/products/product_state.dart';
import 'package:demo_crud/products/repo/product_repo.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc extends BaseBloc {
  ProductRepository? repository;

  ProductBloc(this.repository) {
    getProducts();
  }

  final productState = BehaviorSubject<ProductState>();
  final productDataStream = BehaviorSubject<List<ProductDataModel>?>();

  void getProducts() {
    subscriptions.add(
      _getProducts().listen(
        (state) {
          if (state.isCompleted()) {
            productDataStream.add(state.data?.products);
          }
          productState.add(state);
        },
        onError: (error) {},
      ),
    );
  }

  Stream<ProductState> _getProducts() {
    return repository!
        .getProducts()
        .map((event) => ProductState.completed(event))
        .onErrorReturnWith((error, stackTrace) => ProductState.error(error))
        .startWith(ProductState.loading());
  }

  void loadMore() {
    final currentData = productDataStream.valueOrNull;
    // if we have reached the end already, ignore the request
    if (currentData!.isEndReached) return;
    final currentPage = currentData.currentPage ?? -1;
    // If current page is not handled, it's safe to assume pagination isn't
    // implemented with current source, so we should return
    if (currentPage == -1) return;
    getProducts(
      request: GetReviewsRequest(
        page: currentPage + 1,
      ),
    );
  }
}
