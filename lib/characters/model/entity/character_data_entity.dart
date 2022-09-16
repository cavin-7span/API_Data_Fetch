class CharacterDataEntity{
  String? name;
  String? status;
  String? gender;

  CharacterDataEntity.fromJson(Map<String,dynamic> map){
    name = map["name"];
    status = map["status"];
    gender = map["gender"];
  }
}