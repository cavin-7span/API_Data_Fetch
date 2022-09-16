import 'package:demo_crud/base/base_mapper.dart';
import 'package:demo_crud/products/model/entity/product_category_entity.dart';
import 'package:demo_crud/products/model/product_category_model.dart';

class ProductCategoryEntityMapper extends BaseMapper<ProductCategoryEntity,ProductCategoryModel>{
  @override
  ProductCategoryModel map(ProductCategoryEntity t) {
    return ProductCategoryModel(
      name: t.name,
      id: t.id,
    );
  }

}
