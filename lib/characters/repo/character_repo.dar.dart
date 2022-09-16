import 'package:demo_crud/characters/mapper/character_graphql_response_mapper.dart';
import 'package:demo_crud/characters/model/character_model.dart';
import 'package:demo_crud/characters/source/character_graphql_source.dart';

class CharacterRepo {
  CharacterGraphqlSource? characterGraphqlSource;
  CharacterGraphqlResponseMapper? characterGraphqlResponseMapper;

  CharacterRepo({
    this.characterGraphqlResponseMapper,
    this.characterGraphqlSource,
  });

  Stream<CharacterModel> getCharacters() {
    return characterGraphqlSource!
        .getCharacters()
        .map((response) => characterGraphqlResponseMapper!.map(response));
  }
}
