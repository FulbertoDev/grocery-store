import 'package:grocery_store/app/app.locator.dart';
import 'package:grocery_store/core/data/models/product/product.dart';
import 'package:grocery_store/core/local/local_client.dart';
import 'package:stacked/stacked.dart';

class UserService with ListenableServiceMixin {
  final ReactiveValue<List<Product>> _favorites = ReactiveValue([]);
  List<Product> get favorites => _favorites.value;

  UserService() {
    listenToReactiveValues([_favorites]);
  }

  Future<void> init() async {
    loadFavoritesProducts();
  }

  Future<void> loadFavoritesProducts() async {
    final favs = await locator<LocalClient>().localService().getFavorites();
    _favorites.value = favs;
  }

  Future<void> addToFavorite(Product product) async {
    await locator<LocalClient>().localService().addToFavorite(product);
    await loadFavoritesProducts();
  }

  Future<void> removeFromFavorite(Product product) async {
    await locator<LocalClient>().localService().removeFromFavorite(product);
    await loadFavoritesProducts();
  }
}
