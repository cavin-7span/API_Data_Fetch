import 'package:demo_crud/dashboard/mapper/dashboard_graphql_entity_mapper.dart';
import 'package:demo_crud/dashboard/mapper/dashboard_graphql_response_mapper.dart';
import 'package:demo_crud/dashboard/model/country_model.dart';
import 'package:demo_crud/dashboard/model/dashboard_model.dart';
import 'package:demo_crud/dashboard/model/entity/dashboard_entity.dart';
import 'package:demo_crud/dashboard/source/daashboard_graphql_source.dart';
import 'package:demo_crud/dashboard/source/dashboard_graphql_request.dart';

class DashboardRepo {
  DashboardGraphqlSource? dashboardGraphqlSource;
  DashboardResponseMapper? dashboardResponseMapper;
  CounterGraphQlEntityMapper? counterGraphQlEntityMapper;

  DashboardRepo({
    this.counterGraphQlEntityMapper,
    this.dashboardResponseMapper,
    this.dashboardGraphqlSource,
  });

  Stream<CountryModel> getCountries() {
    return dashboardGraphqlSource!
        .getCountries()
        // .getGoogleFonts()
        .map((event) => dashboardResponseMapper!.map(event));
  }
}
