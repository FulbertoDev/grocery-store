import 'package:grocery_store/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:grocery_store/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:grocery_store/ui/views/home/home_view.dart';
import 'package:grocery_store/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:grocery_store/ui/views/login/login_view.dart';
import 'package:grocery_store/ui/views/register/register_view.dart';

import '../core/api/api_client.dart';
import '../core/local/local_client.dart';
import 'package:grocery_store/services/toast_service.dart';
import 'package:grocery_store/ui/views/product_details/product_details_view.dart';
import 'package:grocery_store/services/user_service.dart';
import 'package:grocery_store/ui/views/favorites/favorites_view.dart';
import 'package:grocery_store/ui/views/settings/settings_view.dart';
import 'package:grocery_store/ui/views/notifications_settings/notifications_settings_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ProductDetailsView),
    MaterialRoute(page: FavoritesView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: NotificationsSettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocalClient),
    LazySingleton(classType: ApiClient),

    LazySingleton(classType: ToastService),
    InitializableSingleton(classType: UserService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
