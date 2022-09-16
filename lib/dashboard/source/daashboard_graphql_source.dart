import 'package:demo_crud/dashboard/model/response/dashboard_response.dart';
import 'package:demo_crud/dashboard/source/dashboard_graphql_request.dart';
import 'package:demo_crud/graphql/app_graphql_client.dart';

class DashboardGraphqlSource {
  final AppGraphQlClient? appGraphQlClient;

  DashboardGraphqlSource({this.appGraphQlClient});

  Stream<CountriesGraphqlResponse> getCountries() {
    return appGraphQlClient!
        .queryString(DashboardGraphqlRequest.countryInfo)
        .map(
          (response) => CountriesGraphqlResponse.fromJson(response!),
        );
  }
}
