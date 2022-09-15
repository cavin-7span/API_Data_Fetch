
import 'dart:developer';

import 'package:demo_crud/dashboard/ui/coutry_view.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountryView(),
    );
  }
}

class GraphQl extends StatelessWidget {
  const GraphQl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpLink = HttpLink("https://countries.trevorblades.com/");
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(
            // dataIdFromObject: typenameDataIdFromObject,
            ),
      ),
    );
    return GraphQLProvider(
      client: client,
      child: DashBoard(),
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Graphql fetch",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(
            r"""
        query getCountry{
            countries {
              name
            }
        }
             """,
          ),
        ),
        builder: (QueryResult result, {refetch, FetchMore? fetchMore}) {
          // return Text("Done");
          if (result.data == null) {
            return Text("Null text");
          }
          return ListView.builder(
            itemCount: result.data!["countries"].length,
            itemBuilder: (ctx, index) {
              log(result.data.toString());
              return ListTile(
                title: Text(result.data!["countries"][index]["name"]),
              );
            },
          );
        },
      ),
    );
  }
}
