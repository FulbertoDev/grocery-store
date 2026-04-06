// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['title'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toDouble(),
      weight: (json['weight'] as num).toInt(),
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num?)?.toInt() ?? 89,
      id: (json['id'] as num).toInt(),
      thumbnail: json['thumbnail'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
      'weight': instance.weight,
      'description': instance.description,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'images': instance.images,
      'category': instance.category,
    };

PaginatedProduct _$PaginatedProductFromJson(Map<String, dynamic> json) =>
    PaginatedProduct(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$PaginatedProductToJson(PaginatedProduct instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
