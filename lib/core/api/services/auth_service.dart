import 'package:dio/dio.dart';
import 'package:grocery_store/core/data/models/product/product.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/models/user/user.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: '/auth')
abstract class AuthService {
  factory AuthService(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger errorLogger,
  }) = _AuthService;

  @POST("/login")
  Future<User> login(@Body() Map<String, dynamic> payload);

  @POST("/register")
  Future<User> register(@Body() Map<String, dynamic> payload);

  @POST("/products?limit=8")
  Future<List<Product>> getProducts();
}
