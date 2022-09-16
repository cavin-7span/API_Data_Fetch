import 'package:demo_crud/products/model/entity/product_category_entity.dart';
import 'package:demo_crud/products/model/entity/product_rating_entity.dart';
import 'package:demo_crud/products/model/product_category_model.dart';
import 'package:demo_crud/products/model/product_rating_model.dart';

class ProductDataEntity{
  String? name;
  int? price;
  String? id;
  List<ProductCategoryEntity>? category;
  ProductRatingEntity? rating;

    ProductDataEntity.fromJson(Map<String,dynamic> map){
      name = map["name"];
      price = map["price"];
      id = map["id"];
      final ratingJson = map['rating'];
      if (ratingJson != null) {
        rating = ProductRatingEntity.fromJson(ratingJson);
      }

      final categoryJson = map['category'];
      if (categoryJson != null && categoryJson is List) {
        category = categoryJson
            .map((e) => ProductCategoryEntity.fromJson(e))
            .toList();
      }
    }
}

