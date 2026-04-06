import 'package:flutter/material.dart';
import 'package:grocery_store/app/app.locator.dart';
import 'package:grocery_store/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/app_colors.dart';
import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: "Settings".text.black.semiBold.lg.make(),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outlined, color: kcPrimaryColor),
            title: "User informations".text.black.semiBold.lg.make(),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
          ListTile(
            leading:
                const Icon(Icons.notifications_outlined, color: kcPrimaryColor),
            title: "Notifications".text.black.semiBold.lg.make(),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              locator<NavigationService>()
                  .navigateToNotificationsSettingsView();
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline, color: kcPrimaryColor),
            title: "Help".text.black.semiBold.lg.make(),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      SettingsViewModel();
}
