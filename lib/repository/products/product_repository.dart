import 'package:vakinha_app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAllProducts();
}
