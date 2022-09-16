import 'package:demo_crud/dashboard/model/entity/dashboard_data_entity.dart';
import 'package:demo_crud/dashboard/model/entity/dashboard_entity.dart';

class CountriesGraphqlResponse {
  List<DashboardGraphqlEntity> countriesGraphqlEntity = [];

  CountriesGraphqlResponse.fromJson(Map<String, dynamic> map) {
    final dataDashBoardJson = map['countries'];
    if (dataDashBoardJson != null && dataDashBoardJson is List) {
      countriesGraphqlEntity.addAll(
        dataDashBoardJson
            .map(
              (e) => DashboardGraphqlEntity.fromJson(e),
            )
            .toList(),
      );
    }
  }
}
