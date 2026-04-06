part of 'local_service.dart';

class _LocalServiceImpl implements LocalService {
  @override
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(DbConstants.currentUser, json.encode(user));
  }

  @override
  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString(DbConstants.currentUser);
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  @override
  Future<void> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(DbConstants.currentUser);
  }

  @override
  Future<void> addToFavorite(Product product) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Product> favorites = await getFavorites();
    favorites.add(product);
    await prefs.setString(DbConstants.favoritesBox, json.encode(favorites));
  }

  @override
  Future<void> removeFromFavorite(Product product) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Product> favorites = await getFavorites();
    final data = favorites.where((item) => item.name != product.name).toList();
    await prefs.setString(DbConstants.favoritesBox, json.encode(data));
  }

  @override
  Future<List<Product>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString(DbConstants.favoritesBox);
    if (favoritesJson != null) {
      return (json.decode(favoritesJson) as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
