import 'package:demo_crud/base/base_bloc.dart';
import 'package:demo_crud/base/base_state.dart';
import 'package:demo_crud/characters/bloc/character_bloc.dart';
import 'package:demo_crud/characters/character_state.dart';
import 'package:demo_crud/characters/di/character_module.dart';
import 'package:demo_crud/characters/model/character_data_model.dart';
import 'package:demo_crud/dashboard/bloc/dashboard_bloc.dart';
import 'package:demo_crud/dashboard/di/dashboard_module.dart';
import 'package:demo_crud/dashboard/model/dashboard_model.dart';
import 'package:demo_crud/dashboard/state/dashobard_state.dart';
import 'package:flutter/material.dart';

class CountryView extends StatefulWidget {
  const CountryView({Key? key}) : super(key: key);

  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends BaseState<CountryView> {
  CharacterBloc? _characterBloc;
  // DashBoardBloc? _dashboardBloc;
  @override
  void initState() {
    super.initState();
    _characterBloc = CharacterModule().getCharacterBloc();
    // _dashboardBloc = DashboardModule().getDashboardBloc();
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
      body: StreamBuilder<CharacterState>(
        stream: _characterBloc!.characterState,
        // stream: _dashboardBloc!.dashboardState,
        builder: (ctx, snapshot) {
          final state = snapshot.data;
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
            return StreamBuilder<List<CharacterDataModel>?>(
                stream: _characterBloc!.characterDataStream,
                builder: (context, snapshot) {
                  final items = snapshot.data ?? [];
                  if (items.isEmpty) {
                    print("empty");
                    return Text("Empty");

                  }
                  return ListView.builder(itemCount: items.length,itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(items[index].name??''),
                      subtitle: Text(items[index].gender??''),
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
    return _characterBloc;
  }
}
