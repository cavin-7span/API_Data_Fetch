import 'package:demo_crud/base/base_bloc.dart';
import 'package:demo_crud/characters/character_state.dart';
import 'package:demo_crud/characters/model/character_data_model.dart';
import 'package:demo_crud/characters/repo/character_repo.dar.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc extends BaseBloc {
  CharacterRepo? characterRepo;

  CharacterBloc(this.characterRepo) {
    getCharacters();
  }

  final characterState = BehaviorSubject<CharacterState>();
  final characterDataStream = BehaviorSubject<List<CharacterDataModel>?>();

  void getCharacters() {
    subscriptions.add(
      _getCharacters().listen(
        (state) {
          if (state.isCompleted()) {
            print("state data: ${state.data?.characterDataModel?.first.name??"Blank name"}");
            characterDataStream.add(state.data?.characterDataModel);
          }
          characterState.add(state);
        },onError: (error){}
      ),
    );
  }

  Stream<CharacterState> _getCharacters() {
    return characterRepo!
        .getCharacters()
        .map((event) => CharacterState.completed(event))
        .onErrorReturnWith((error, stackTrace) => CharacterState.error(error))
        .startWith(CharacterState.loading());
  }
}
