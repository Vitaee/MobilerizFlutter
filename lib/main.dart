import 'package:flutter/material.dart';
import 'package:flutter_app/application/usecases/fetch_product_usecase.dart';
import 'package:flutter_app/dependency_injection/injector.dart';
import 'package:flutter_app/presentation/pages/product_list_page.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/product_provider.dart';

void main() {
  setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(
            fetchProductsUseCase: serviceLocator<FetchProductsUseCase>(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unified Product Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
    );
  }
}
