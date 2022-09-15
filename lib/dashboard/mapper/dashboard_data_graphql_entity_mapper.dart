import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/dashboard/mapper/dashboard_graphql_entity_mapper.dart';
import 'package:demo_crud/dashboard/model/country_model.dart';
import 'package:demo_crud/dashboard/model/entity/dashboard_data_entity.dart';

class DashboardDataGraphQlEntityMapper
    extends BaseMapper<DashboardDataGraphqlEntity, CountryModel> {

  CounterGraphQlEntityMapper entity = CounterGraphQlEntityMapper();

  @override
  CountryModel map(DashboardDataGraphqlEntity t) {
    return CountryModel(
     dashboardModel: t.dashBoardModel?.map((e) => entity.map(e)).toList(),
    );
  }
}
