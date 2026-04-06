import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../common/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: kcPrimaryColor),
            accountName: "Fulberto".text.make(),
            accountEmail: "fulberto@gmail.com".text.make(),
          ),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ListTile(
                leading: const Icon(Icons.home_rounded, color: kcPrimaryColor),
                title: "Home".text.black.semiBold.lg.make(),
                onTap: () => navigate(Routes.homeView),
              ),
              ListTile(
                leading:
                    const Icon(Icons.favorite_rounded, color: kcPrimaryColor),
                title: "Favorites".text.black.semiBold.lg.make(),
                onTap: () => navigate(Routes.favoritesView),
              ),
              ListTile(
                leading:
                    const Icon(Icons.person_rounded, color: kcPrimaryColor),
                title: "Profile".text.black.semiBold.lg.make(),
                onTap: () {},
              ),
              ListTile(
                leading:
                    const Icon(Icons.settings_rounded, color: kcPrimaryColor),
                title: "Settings".text.black.semiBold.lg.make(),
                onTap: () => navigate(Routes.settingsView),
              ),
              ListTile(
                leading:
                    const Icon(Icons.logout_rounded, color: kcPrimaryColor),
                title: "Logout".text.black.semiBold.lg.make(),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  void navigate(String route) {
    locator<NavigationService>().back();

    if (locator<NavigationService>().currentRoute == route) {
    } else {
      locator<NavigationService>().navigateTo(route);
    }
  }
}
