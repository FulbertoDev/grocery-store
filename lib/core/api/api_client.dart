import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_store/core/api/services/auth_service.dart';

import '../interceptors/request_interceptor.dart';
import '../utils/api_config.dart';
import 'services/product_service.dart';

class ApiClient {
  AuthService? _authService;
  ProductService? _productService;

  Dio? _dio;
  Dio get dio => _dio!;

  AuthService authService() => _authService!;
  ProductService productService() => _productService!;

  static final ApiClient _apiClient = ApiClient._internal();

  factory ApiClient() => _apiClient;

  ApiClient._internal() {
    _dio ??= Dio();
    _dio?.options.baseUrl = baseUrl;
    _dio?.options.connectTimeout = const Duration(seconds: 30);
    _dio?.options.receiveTimeout = const Duration(seconds: 30);
    _dio?.options.sendTimeout = const Duration(seconds: 30);
    _dio?.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    _dio?.interceptors.addAll([RequestInterceptor()]);

    if (kDebugMode) {
      _dio?.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          requestBody: true,
          error: true,
          request: true,
        ),
      );
    }

    _authService ??= AuthService(_dio!);
    _productService ??= ProductService(_dio!);
  }
}
