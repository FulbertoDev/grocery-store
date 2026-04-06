import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/app_colors.dart';
import 'notifications_settings_viewmodel.dart';

class NotificationsSettingsView
    extends StackedView<NotificationsSettingsViewModel> {
  const NotificationsSettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationsSettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: "Notifications settings".text.black.semiBold.lg.make(),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outlined, color: kcPrimaryColor),
            title: "Enable notifications".text.black.semiBold.lg.make(),
            trailing: Switch(
              value: viewModel.isNotificationEnabled,
              onChanged: (value) => viewModel.toggleNotification(),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.email_outlined, color: kcPrimaryColor),
            title: "Email alerts".text.black.semiBold.lg.make(),
            trailing: Switch(
              value: viewModel.isEmailAlertsEnabled,
              onChanged: (value) => viewModel.toggleEmailAlerts(),
            ),
          ),
          const Divider(),
          ListTile(
            leading:
                const Icon(Icons.shopping_cart_outlined, color: kcPrimaryColor),
            title: "Order alerts".text.black.semiBold.lg.make(),
            trailing: Switch(
              value: viewModel.isOrderAlertsEnabled,
              onChanged: (value) => viewModel.toggleOrderAlerts(),
            ),
          ),
          const Divider(),
          ListTile(
            leading:
                const Icon(Icons.shopping_cart_outlined, color: kcPrimaryColor),
            title: "Product recommendations".text.black.semiBold.lg.make(),
            trailing: Switch(
              value: viewModel.isProductRecommendationsEnabled,
              onChanged: (value) => viewModel.toggleProductRecommendations(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  NotificationsSettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationsSettingsViewModel();
}
