import 'package:flutter/material.dart';
import 'package:flutter_app/application/usecases/fetch_product_usecase.dart';
import '../../domain/entities/product.dart';

class ProductProvider with ChangeNotifier {
  final FetchProductsUseCase fetchProductsUseCase;

  ProductProvider({required this.fetchProductsUseCase});

  List<Product> _products = [];
  List<Product> get products => _products;

  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await fetchProductsUseCase.execute();
      _filteredProducts = _products;
      _errorMessage = '';
    } catch (e) {
      print(e.toString());
      print("^^^^^^^^^^^^");
      _errorMessage = 'Failed to load products.';
    }
    _isLoading = false;
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
