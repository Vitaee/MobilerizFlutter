import 'dart:convert';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<Product>> fetchProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({http.Client? client})
      : client = client ?? http.Client();

  @override
  Future<List<Product>> fetchProducts() async {
    final response =
        await client.get(Uri.parse('http://10.0.2.2:8000/products'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      final productResponse = ProductResponse.fromJson(jsonResponse);
      return productResponse.data;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
