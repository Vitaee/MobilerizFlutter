import 'package:flutter_app/infrastructure/models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  //Future<Product> getProductById(String id);
}
