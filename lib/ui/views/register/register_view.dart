import 'package:flutter/material.dart';
import 'package:grocery_store/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../app/app.locator.dart';
import '../../../gen/assets.gen.dart';
import '../../common/app_colors.dart';
import '../../common/app_enums.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/ui/buttons/raised_button.dart';
import '../../widgets/ui/inputs/custom_input.dart';
import 'register_view.form.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: "username"),
  FormTextField(name: "email"),
  FormTextField(name: "password"),
])
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        spacing: baseline_4x_5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.img.logo.image(height: 200).centered(),
          Column(
            spacing: baseline_2x_5,
            children: [
              CustomInput(
                label: "Username",
                controller: usernameController,
                errorMessage: viewModel.usernameValidationMessage,
              ),
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
              AppRaisedButton(label: "Sign up", onPressed: viewModel.submit)
            ],
          ).px24(),
          "Already have an account ?  "
              .richText
              .withTextSpanChildren([
                "Sign up".textSpan.semiBold.color(kcPrimaryColor).make(),
              ])
              .makeCentered()
              .p8()
              .onInkTap(() {
                locator<NavigationService>().replaceWithLoginView();
              })
        ],
      ).safeArea(),
    );
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(RegisterViewModel viewModel) {
    disposeForm();
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
