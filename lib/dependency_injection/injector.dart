import 'package:flutter_app/application/usecases/fetch_product_usecase.dart';
import 'package:get_it/get_it.dart';

import '../domain/repositories/product_repository.dart';
import '../infrastructure/data_sources/product_local_data_source.dart';
import '../infrastructure/data_sources/product_remote_data_source.dart';
import '../infrastructure/repositories/product_repository_impl.dart';

final serviceLocator = GetIt.instance;

void setup() {
  // Data Sources
  serviceLocator.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(),
  );

  // Repositories
  serviceLocator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(
    () => FetchProductsUseCase(serviceLocator()),
  );
}
