import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository repository;

  FetchProductsUseCase(this.repository);

  Future<List<Product>> execute() {
    return repository.getProducts();
  }
}
