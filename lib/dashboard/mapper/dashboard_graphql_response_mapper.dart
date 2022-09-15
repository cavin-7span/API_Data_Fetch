import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/dashboard/mapper/dashboard_data_graphql_entity_mapper.dart';
import 'package:demo_crud/dashboard/mapper/dashboard_graphql_entity_mapper.dart';
import 'package:demo_crud/dashboard/model/country_model.dart';
import 'package:demo_crud/dashboard/model/dashboard_model.dart';
import 'package:demo_crud/dashboard/model/response/dashboard_response.dart';

class DashboardResponseMapper
    extends BaseMapper<CountriesGraphqlResponse, CountryModel> {
  // final dashboardEntityMapper = DashboardDataGraphQlEntityMapper();
  CounterGraphQlEntityMapper counterGraphQlEntityMapper = CounterGraphQlEntityMapper();

  CountryModel map(CountriesGraphqlResponse t) {
    return CountryModel(
        dashboardModel:t.countriesGraphqlEntity.map((e) => counterGraphQlEntityMapper.map(e)).toList());
  }
}
