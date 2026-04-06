import 'package:dio/dio.dart';
import 'package:grocery_store/core/data/models/product/product.dart';
import 'package:retrofit/retrofit.dart';

part 'product_service.g.dart';

@RestApi(baseUrl: '/products')
abstract class ProductService {
  factory ProductService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger errorLogger,
  }) = _ProductService;

  @GET("/category/groceries")
  Future<PaginatedProduct> getProducts();
}
