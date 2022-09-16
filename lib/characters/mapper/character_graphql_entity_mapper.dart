import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/characters/model/character_data_model.dart';
import 'package:demo_crud/characters/model/entity/character_data_entity.dart';

class CharacterGraphqlEntityMapper extends BaseMapper<CharacterDataEntity,CharacterDataModel>{
  @override
  CharacterDataModel map(CharacterDataEntity t) {
    return CharacterDataModel(
      gender: t.gender,
      name: t.name,
      status: t.status,
    );
  }

}