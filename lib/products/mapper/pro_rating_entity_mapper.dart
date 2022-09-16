import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/products/model/entity/product_rating_entity.dart';
import 'package:demo_crud/products/model/product_rating_model.dart';

class ProductRatingEntityMapper
    extends BaseMapper<ProductRatingEntity, ProductRatingModel> {
  @override
  ProductRatingModel map(ProductRatingEntity t) {
    return ProductRatingModel(
      average: t.average,
      total: t.total,
    );
  }
}
