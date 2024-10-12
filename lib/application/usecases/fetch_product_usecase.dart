import 'package:flutter_app/infrastructure/models/product_model.dart';

import '../../domain/repositories/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository repository;

  FetchProductsUseCase(this.repository);

  Future<List<Product>> execute() {
    return repository.getProducts();
  }
}
