import '../models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({http.Client? client})
      : client = client ?? http.Client();

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response =
        await client.get(Uri.parse('http://10.0.2.2:8000/products'));

    print("ashdhashdasdd");

    if (response.statusCode == 200) {
      // Use the listFromJson method to parse the response body
      return ProductModel.listFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
