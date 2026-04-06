import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/data/models/product/product.dart';
import '../../../services/user_service.dart';

class ProductDetailsViewModel extends ReactiveViewModel {
  final _service = locator<UserService>();

  List<Product> get favorites => _service.favorites;

  Future<void> addOrRemoveFavorite(Product product, bool isFavorite) async {
    if (isFavorite) {
      await _service.removeFromFavorite(product);
    } else {
      await _service.addToFavorite(product);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_service];
}
