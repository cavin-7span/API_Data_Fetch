import 'package:demo_crud/products/model/product_category_model.dart';
import 'package:demo_crud/products/model/product_rating_model.dart';

class ProductDataModel {
  String? name;
  int? price;
  String? id;
  List<ProductCategoryModel>? category;
  ProductRatingModel? rating;

  ProductDataModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.rating,
  });
}
