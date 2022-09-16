
import 'package:demo_crud/characters/model/entity/character_data_entity.dart';

class CharactersGraphqlResponse {
  List<CharacterDataEntity> characterDataEntity = [];

  CharactersGraphqlResponse.fromJson(Map<String, dynamic> map) {

    final json = map['characters'];
    final dataCharacterJson = json['results'];

    if (dataCharacterJson != null && dataCharacterJson is List) {
      characterDataEntity.addAll(
        dataCharacterJson
            .map(
              (e) => CharacterDataEntity.fromJson(e),
        )
            .toList(),
      );
    }
  }
}
