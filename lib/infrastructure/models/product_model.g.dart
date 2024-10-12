// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String,
      name: json['product_name'] as String,
      description: json['product_description'] as String,
      price: (json['product_price'] as num).toDouble(),
      photoUrl: json['product_image'] as String,
      category: json['product_category'] as String?,
      brandId: json['product_brand_id'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'product_name': instance.name,
      'product_description': instance.description,
      'product_price': instance.price,
      'product_image': instance.photoUrl,
      'product_category': instance.category,
      'product_brand_id': instance.brandId,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      pageNumber: (json['page_number'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      numberOfData: (json['number_of_data'] as num).toInt(),
      numberOfPage: (json['number_of_page'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page_number': instance.pageNumber,
      'per_page': instance.perPage,
      'number_of_data': instance.numberOfData,
      'number_of_page': instance.numberOfPage,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };
