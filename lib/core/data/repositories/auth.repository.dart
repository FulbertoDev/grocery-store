import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery_store/core/data/models/user/user.dart';
import 'package:grocery_store/core/local/local_client.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../api/api_client.dart';

class AuthRepository {
  final _authClient = locator<ApiClient>().authService();
  final _localClient = locator<LocalClient>().localService();
  final _logger = getLogger("AuthRepository");

  Future<Either<String, User>> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final payload = {
        "email": email,
        "password": password,
        "username": username,
      };
      _logger.w("User payload: $payload");
      final response = await _authClient.register(payload);
      return right(response);
    } on DioException catch (_) {
      return left("Une erreur est survenue");
    } catch (e) {
      _logger.e(e);
      return left("Une erreur est survenue");
    }
  }

  Future<Either<String, User?>> login(
    String email,
    String password,
    String token,
  ) async {
    try {
      Map<String, String> payload = {"email": email, "password": password};
      final response = await _authClient.login(payload);
      await _localClient.saveUser(response);
      return right(response);
    } on DioException catch (exception) {
      _logger.e(exception);
      int? statusCode = exception.response?.statusCode;
      String errorMessage = "Une erreur est survenue";
      if (statusCode == 401) {
        errorMessage = "Identifiants invalides";
      }
      return left(errorMessage);
    } catch (e) {
      if (e is TypeError) {
        _logger.e(e.stackTrace);
      }
      _logger.e(e);
      return left("Une erreur est survenue");
    }
  }

  Future<Either<String, bool>> logout() async {
    try {
      await _localClient.clearData();
      return right(true);
    } catch (e) {
      _logger.e(e);
      return left("Une erreur est survenue");
    }
  }
}
