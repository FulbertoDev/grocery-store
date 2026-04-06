import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final int id;
  @JsonKey(name: 'title')
  final String name;
  final String thumbnail;
  final double price;
  final int weight;
  final String description;
  final double rating;
  @JsonKey(defaultValue: 89)
  final int reviewsCount;
  final List<String> images;
  final String category;

  Product({
    required this.name,
    required this.images,
    required this.price,
    required this.weight,
    required this.description,
    required this.rating,
    required this.reviewsCount,
    required this.id,
    required this.thumbnail,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginatedProduct {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  PaginatedProduct({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory PaginatedProduct.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProductFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedProductToJson(this);
}
