import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/products/mapper/pro_category_entity_mapper.dart';
import 'package:demo_crud/products/mapper/pro_rating_entity_mapper.dart';
import 'package:demo_crud/products/model/entity/product_data_entity.dart';
import 'package:demo_crud/products/model/product_data_model.dart';

class ProductDataEntityMapper
    extends BaseMapper<ProductDataEntity, ProductDataModel> {
  final _productCategoryMapper = ProductCategoryEntityMapper();
  final _productRatingMapper = ProductRatingEntityMapper();

  @override
  ProductDataModel map(ProductDataEntity t) {
    return ProductDataModel(
      id: t.id,
      name: t.name,
      category: t.category?.map((e) => _productCategoryMapper.map(e)).toList(),
      price: t.price,
      rating: _productRatingMapper.map(t.rating!),
    );
  }
}
