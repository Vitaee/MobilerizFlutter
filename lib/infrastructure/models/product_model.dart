import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'product_name')
  final String name;

  @JsonKey(name: 'product_description')
  final String description;

  @JsonKey(name: 'product_price')
  final double price;

  @JsonKey(name: 'product_image')
  final String photoUrl;

  @JsonKey(name: 'product_category')
  final String? category;

  @JsonKey(name: 'product_brand_id')
  final String? brandId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photoUrl,
    this.category,
    this.brandId,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  // Database mapping
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      photoUrl: map['photoUrl'] as String,
      category: map['category'] as String?,
      brandId: map['brandId'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'photoUrl': photoUrl,
      'category': category,
      'brandId': brandId,
    };
  }
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: 'page_number')
  final int pageNumber;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'number_of_data')
  final int numberOfData;

  @JsonKey(name: 'number_of_page')
  final int numberOfPage;

  Pagination({
    required this.pageNumber,
    required this.perPage,
    required this.numberOfData,
    required this.numberOfPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class ProductResponse {
  final List<Product> data;
  final Pagination pagination;

  ProductResponse({
    required this.data,
    required this.pagination,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
