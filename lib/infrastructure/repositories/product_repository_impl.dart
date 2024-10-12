import 'package:flutter_app/domain/repositories/product_repository.dart';
import 'package:flutter_app/infrastructure/models/product_model.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Product>> getProducts() async {
    try {
      final localProducts = await localDataSource.getProducts();
      if (localProducts.isNotEmpty) {
        return localProducts;
      } else {
        final remoteProducts = await remoteDataSource.fetchProducts();
        await localDataSource.cacheProducts(remoteProducts);
        return remoteProducts;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
