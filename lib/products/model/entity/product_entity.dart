import 'package:demo_crud/products/model/entity/product_data_entity.dart';

class ProductEntity{
  List<ProductDataEntity>? products;

  ProductEntity.fromJson(Map<String,dynamic> map){
    products = map["data"];
  }

}