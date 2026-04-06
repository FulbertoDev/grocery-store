import 'package:flutter/material.dart';
import 'package:grocery_store/app/app.locator.dart';
import 'package:grocery_store/app/app.router.dart';
import 'package:grocery_store/gen/assets.gen.dart';
import 'package:grocery_store/ui/widgets/ui/buttons/raised_button.dart';
import 'package:grocery_store/ui/widgets/ui/inputs/custom_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/app_colors.dart';
import '../../common/app_enums.dart';
import '../../common/ui_helpers.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: "email"),
  FormTextField(name: "password"),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        spacing: baseline_4x_5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.img.logo.image(height: 200).centered(),
          Column(
            spacing: baseline_2x,
            children: [
              CustomInput(
                label: "Email",
                controller: emailController,
                errorMessage: viewModel.emailValidationMessage,
              ),
              CustomInput(
                label: "Password",
                variant: InputType.password,
                controller: passwordController,
                errorMessage: viewModel.passwordValidationMessage,
              ),
              AppRaisedButton(label: "Sign in", onPressed: viewModel.submit)
            ],
          ).px24(),
          "Don’t have an account ?  "
              .richText
              .withTextSpanChildren([
                "Sign up".textSpan.semiBold.color(kcPrimaryColor).make(),
              ])
              .makeCentered()
              .p8()
              .onInkTap(() {
                locator<NavigationService>().replaceWithRegisterView();
              })
        ],
      ).safeArea(),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    disposeForm();
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
