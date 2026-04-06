import 'package:dio/dio.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../api/api_client.dart';
import '../models/product/product.dart';

class ProductRepository {
  final _productClient = locator<ApiClient>().productService();
  final _logger = getLogger("ProductRepository");

  Future<List<Product>> getProducts() async {
    try {
      final response = await _productClient.getProducts();
      return response.products;
    } on DioException catch (e) {
      _logger.e(e.message);
      return [];
    } catch (e) {
      if (e is TypeError) {
        _logger.e(e.stackTrace.toString());
      }

      _logger.e(e);
      return [];
    }
  }
}
