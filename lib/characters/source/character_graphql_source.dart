import 'package:demo_crud/characters/model/response/response.dart';
import 'package:demo_crud/characters/source/character_graphql_request.dart';
import 'package:demo_crud/graphql/app_graphql_client.dart';

class CharacterGraphqlSource {
  final AppGraphQlClient? appGraphQlClient;

  CharacterGraphqlSource({this.appGraphQlClient});

  Stream<CharactersGraphqlResponse> getCharacters() {
    return appGraphQlClient!
        .queryString(CharacterGraphqlRequest.queryCharacter)
        .map(
          (response) => CharactersGraphqlResponse.fromJson(response!),
        );
  }
}
