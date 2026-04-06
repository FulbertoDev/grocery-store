import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../../app/app.logger.dart';
import '../data/repositories/auth.repository.dart';

class RequestInterceptor extends Interceptor {
  final logger = getLogger("RequestInterceptor");

  bool _isLoggingOut = false;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final path = err.requestOptions.path;
    final method = err.requestOptions.method;

    final isLoginRequest = path == "/identity/sessions" && method == "POST";

    if (err.response?.statusCode == 401 && !isLoginRequest) {
      return await _safeLogout();
    }
    handler.next(err);
  }

  Future<void> logOut() async {
    final repository = AuthRepository();

    await repository.logout();
  }

  Future<void> _safeLogout() async {
    if (_isLoggingOut) return;
    _isLoggingOut = true;
    try {
      await logOut();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _isLoggingOut = false;
    }
  }
}
