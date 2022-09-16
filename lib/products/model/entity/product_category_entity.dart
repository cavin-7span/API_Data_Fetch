class ProductCategoryEntity{
  String? id;
  String? name;

  ProductCategoryEntity.fromJson(Map<String,dynamic> map){
    id = map["id"];
    name = map["name"];
  }
}