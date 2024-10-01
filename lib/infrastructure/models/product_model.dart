import 'dart:convert';

import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required String photoUrl,
    // Add other fields if necessary
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          photoUrl: photoUrl,
        );

  // Factory method to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      photoUrl: json['photoUrl'] as String,
      // Initialize other fields if necessary
    );
  }

  // Method to convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'photoUrl': photoUrl,
      // Add other fields if necessary
    };
  }

  // Static method to parse a list of ProductModels from JSON string
  static List<ProductModel> listFromJson(String jsonString) {
    final Iterable<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
