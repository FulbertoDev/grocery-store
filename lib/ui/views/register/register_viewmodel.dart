import 'package:grocery_store/app/app.locator.dart';
import 'package:grocery_store/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'register_view.form.dart';

class RegisterViewModel extends FormViewModel {
  void submit() async {
    final isValid = await validateForm();
    if (!isValid) {
      notifyListeners();
      return;
    }
    locator<ToastService>()
        .showErrorNotification(message: "Cannot register in this app.");
  }

  Future<bool> validateForm() async {
    if (usernameValue.isEmptyOrNull) {
      setUsernameValidationMessage("Enter a value");
    }
    if (emailValue.isEmptyOrNull) {
      setEmailValidationMessage("Enter a value");
    }
    if (passwordValue.isEmptyOrNull) {
      setPasswordValidationMessage("Enter a value");
    }
    return !hasAnyValidationMessage;
  }
}
