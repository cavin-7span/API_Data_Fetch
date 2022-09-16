import 'package:demo_crud/base/base_ui_state.dart';
import 'package:demo_crud/characters/model/character_model.dart';

class CharacterState extends BaseUiState<CharacterModel> {
  CharacterState.loading() : super.loading();

  CharacterState.completed(CharacterModel data) : super.completed(data: data);

  CharacterState.error(dynamic error) : super.error(error);
}
