class DashboardGraphqlEntity {
  String? name;
  String? code;

  DashboardGraphqlEntity.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    code = map['code'];
  }
}
