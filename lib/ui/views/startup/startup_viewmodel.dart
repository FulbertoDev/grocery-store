import 'package:stacked/stacked.dart';
import 'package:grocery_store/app/app.locator.dart';
import 'package:grocery_store/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    _navigationService.replaceWithHomeView();

    /*User? user = await locator<LocalClient>().localService().getUser();
    await Future.delayed(const Duration(seconds: 3));

    if (user != null) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithLoginView();
    }*/
  }
}
