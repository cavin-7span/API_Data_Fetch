import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/characters/mapper/character_graphql_entity_mapper.dart';
import 'package:demo_crud/characters/model/character_model.dart';
import 'package:demo_crud/characters/model/response/response.dart';

class CharacterGraphqlResponseMapper
    extends BaseMapper<CharactersGraphqlResponse, CharacterModel> {
  CharacterGraphqlEntityMapper characterGraphqlEntityMapper =
      CharacterGraphqlEntityMapper();

  @override
  CharacterModel map(CharactersGraphqlResponse t) {
    return CharacterModel(
        characterDataModel: t.characterDataEntity
            .map((e) => characterGraphqlEntityMapper.map(e))
            .toList());
  }
}
