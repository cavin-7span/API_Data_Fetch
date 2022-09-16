import 'package:demo_crud/characters/bloc/character_bloc.dart';
import 'package:demo_crud/characters/mapper/character_graphql_response_mapper.dart';
import 'package:demo_crud/characters/repo/character_repo.dar.dart';
import 'package:demo_crud/characters/source/character_graphql_source.dart';
import 'package:demo_crud/graphql/app_graphql_client.dart';

class CharacterModule {
  static final _instance = CharacterModule._internal();

  CharacterModule._internal();

  factory CharacterModule() {
    return _instance;
  }

  CharacterBloc getCharacterBloc() {
    return CharacterBloc(
      CharacterModule().getCharacterRepo(),
    );
  }

  CharacterRepo getCharacterRepo() {
    return CharacterRepo(
      characterGraphqlResponseMapper: CharacterGraphqlResponseMapper(),
      characterGraphqlSource: CharacterGraphqlSource(
        appGraphQlClient:
            AppGraphQlClient("https://rickandmortyapi.com/graphql#"),
      ),
    );
  }
}
