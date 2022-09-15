import 'package:demo_crud/base/base_bloc.dart';
import 'package:demo_crud/base/base_state.dart';
import 'package:demo_crud/dashboard/bloc/dashboard_bloc.dart';
import 'package:demo_crud/dashboard/di/dashboard_module.dart';
import 'package:demo_crud/dashboard/model/dashboard_model.dart';
import 'package:demo_crud/dashboard/state/dashobard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountryView extends StatefulWidget {
  const CountryView({Key? key}) : super(key: key);

  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends BaseState<CountryView> {
  DashBoardBloc? _dashboardBloc;
  @override
  void initState() {
    super.initState();
    _dashboardBloc = DashboardModule().getDashboardBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Graphql fetch",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: StreamBuilder<DashboardState>(
        stream: _dashboardBloc!.dashboardState,
        builder: (ctx, snapshot) {
          final state = snapshot.data;
          /// Loading indicator
          if (state?.isLoading() ?? true) {
            return const Center(
              child: Text("Data is loading"),
            );
          }
          if (state?.isError() ?? true) {
            return Center(
              child: Text("Error: ${(state?.error.toString()??'')}"),
            );
          }
          else {
            return StreamBuilder<List<DashboardModel>?>(
                stream: _dashboardBloc!.countryDataStream,
                builder: (context, snapshot) {
                  final items = snapshot.data ?? [];
                  return ListView.builder(itemCount: items.length,itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(items[index].name??''),
                    );
                  });
                });
          }
        },
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return _dashboardBloc;
  }
}
