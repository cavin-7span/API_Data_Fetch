// class DashBoardGraphQLEntity {
//   DashBoardGraphQLEntityData? data;

//   DashBoardGraphQLEntity({this.data});

//   DashBoardGraphQLEntity.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null
//         ? DashBoardGraphQLEntityData.fromJson(json['data'])
//         : null;
//   }
// }

// class DashBoardGraphQLEntityData {
//   List<Countries>? countries;

//   DashBoardGraphQLEntityData({this.countries});

//   DashBoardGraphQLEntityData.fromJson(Map<String, dynamic> json) {
//     if (json['countries'] != null) {
//       countries = <Countries>[];
//       json['countries'].forEach((v) {
//         countries!.add(Countries.fromJson(v));
//       });
//     }
//   }
// }

// class Countries {
//   String? currency;
//   String? code;

//   Countries({this.currency, this.code});

//   Countries.fromJson(Map<String, dynamic> json) {
//     currency = json['currency'];
//     code = json['code'];
//   }
// }
import 'package:demo_crud/dashboard/model/dashboard_model.dart';
import 'package:demo_crud/dashboard/model/entity/dashboard_entity.dart';

class DashboardDataGraphqlEntity {
 List<DashboardGraphqlEntity>? dashBoardModel;

  DashboardDataGraphqlEntity.fromJson(Map<String, dynamic> map) {
    dashBoardModel = map['countries'];
  }
}
