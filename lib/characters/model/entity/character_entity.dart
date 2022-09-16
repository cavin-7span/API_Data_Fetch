
import 'package:demo_crud/characters/model/entity/character_data_entity.dart';

class CharacterEntity {
  List<CharacterDataEntity>? characterEntity;

  CharacterEntity.fromJson(Map<String, dynamic> map) {
    characterEntity = map["results"];
  }
}
