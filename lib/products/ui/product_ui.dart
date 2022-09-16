import 'package:demo_crud/base/base_bloc.dart';
import 'package:demo_crud/base/base_state.dart';
import 'package:demo_crud/products/bloc/product_bloc.dart';
import 'package:demo_crud/products/di/product_module.dart';
import 'package:demo_crud/products/model/product_data_model.dart';
import 'package:demo_crud/products/product_state.dart';
import 'package:demo_crud/widgets/pagination_wrapper.dart';
import 'package:flutter/material.dart';

class ProductUI extends StatefulWidget {
  const ProductUI({Key? key}) : super(key: key);

  @override
  State<ProductUI> createState() => _ProductUIState();
}

class _ProductUIState extends BaseState<ProductUI> {
  ProductBloc? _productBloc;

  @override
  void initState() {
    _productBloc = ProductModule().getProductBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Graphql Product fetch",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: StreamBuilder<ProductState>(
        stream: _productBloc!.productState,
        builder: (ctx, snapshot) {
          final state = snapshot.data;
          if (state?.isLoading() ?? true) {
            return const Center(
              child: Text("Data is loading"),
            );
          }
          if (state?.isError() ?? true) {
            return const Center(
              child: Text("Data has error"),
            );
          } else {
            return StreamBuilder<List<ProductDataModel>?>(
              stream: _productBloc!.productDataStream,
              builder: (context, snapshot) {
                bool isEndReached = state?.data?.isEndReached ?? false;
                final items = snapshot.data ?? [];
                if (items.isEmpty) {
                  print("empty");
                  return const Center(
                    child: Text("Empty"),
                  );
                }
                return PaginationWrapper(
                  isLoading: state!.isLoading(),
                  isEndReached: isEndReached,
                  onLoadMore: () {
                    _productBloc?.loadMore();
                  },
                  scrollableChild:ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        title: Text(items[index].name ?? ''),
                        subtitle: Text(items[index].price.toString() ?? ''),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return _productBloc;
  }
}
