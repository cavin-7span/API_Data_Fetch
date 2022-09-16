class CharacterGraphqlRequest{
  static String queryCharacter = r"""
                          query getCharacters {
                          characters {
                            results {
                              name
                              status
                              gender
                            }
                          }
                        }
                          """;
}