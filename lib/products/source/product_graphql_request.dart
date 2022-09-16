class ProductGraphqlRequest{
  static const String getProducts = """
                  query getProducts{
                    products(hash:"o0yy"){
                      data{
                        name
                        price
                        id
                        category{
                          id
                          name
                        }
                        rating{
                          average
                          total
                        }
                      }
                      pagination{
                        hasMorePages
                        total
                        currentPage
                      }
                    }
                  }
                    """;
}