import 'package:flutter/scheduler.dart';
import 'package:grocery_store/core/data/models/product/product.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/data/repositories/product.repository.dart';
import '../../../services/user_service.dart';

class HomeViewModel extends ReactiveViewModel {
  final _service = locator<UserService>();
  final _productRepository = ProductRepository();

  List<Product> get favorites => _service.favorites;

  List<Product> _products = [];
  List<Product> get products => _products;

  HomeViewModel() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getProducts();
    });
  }

  Future<void> _getProducts() async {
    _products = await _productRepository.getProducts();
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_service];
}
