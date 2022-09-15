class DashboardGraphqlRequest {
  static String countryInfo = r""" 
                  query getCountry{
                            countries {
                              name
                              code
                            }
                        }
                              """;
}
