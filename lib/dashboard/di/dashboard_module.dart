import 'package:demo_crud/dashboard/bloc/dashboard_bloc.dart';
import 'package:demo_crud/dashboard/mapper/dashboard_graphql_entity_mapper.dart';
import 'package:demo_crud/dashboard/mapper/dashboard_graphql_response_mapper.dart';
import 'package:demo_crud/dashboard/repo/dashboard_repo.dart';
import 'package:demo_crud/dashboard/source/daashboard_graphql_source.dart';
import 'package:demo_crud/graphql/app_graphql_client.dart';

class DashboardModule {
  static final _instance = DashboardModule._internal();

  DashboardModule._internal();

  factory DashboardModule() {
    return _instance;
  }

  /// Get dashboard BLoC
  DashBoardBloc getDashboardBloc() {
    return DashBoardBloc(
      DashboardModule().getDashboardRepo(),
    );
  }

  /// Get dashboard repo
  DashboardRepo getDashboardRepo() {
    return DashboardRepo(
      dashboardGraphqlSource: DashboardGraphqlSource(
        appGraphQlClient:
            AppGraphQlClient("https://countries.trevorblades.com/"),
      ),
      dashboardResponseMapper: DashboardResponseMapper(),
    );
  }
}
