import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/dashboard/model/dashboard_model.dart';
import 'package:demo_crud/dashboard/model/entity/dashboard_entity.dart';

class CounterGraphQlEntityMapper
    extends BaseMapper<DashboardGraphqlEntity, DashboardModel> {
  @override
  DashboardModel map(DashboardGraphqlEntity t) {
    return DashboardModel(
      code: t.code,
      name: t.name,
    );
  }
}
