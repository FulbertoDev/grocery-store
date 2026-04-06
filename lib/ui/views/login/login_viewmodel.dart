import 'package:grocery_store/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../app/app.locator.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  void submit() async {
    final isValid = await validateForm();
    if (!isValid) {
      notifyListeners();
      return;
    }
    locator<NavigationService>().replaceWithHomeView();
  }

  Future<bool> validateForm() async {
    if (emailValue.isEmptyOrNull) {
      setEmailValidationMessage("Enter a value");
    }
    if (passwordValue.isEmptyOrNull) {
      setPasswordValidationMessage("Enter a value");
    }
    return !hasAnyValidationMessage;
  }
}
