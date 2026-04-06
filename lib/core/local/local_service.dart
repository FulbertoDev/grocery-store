import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/product/product.dart';
import '../data/models/user/user.dart';
import 'helpers.dart';

part 'local_service_impl.dart';

abstract class LocalService {
  factory LocalService() = _LocalServiceImpl;

  Future<void> saveUser(User user);
  Future<User?> getUser();
  Future<void> clearData();
  Future<void> addToFavorite(Product product);
  Future<void> removeFromFavorite(Product product);
  Future<List<Product>> getFavorites();
}
