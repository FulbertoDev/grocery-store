import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/app/app.bottomsheets.dart';
import 'package:grocery_store/app/app.dialogs.dart';
import 'package:grocery_store/app/app.locator.dart';
import 'package:grocery_store/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';

import 'ui/common/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: kcPrimaryColor,
            elevation: 0,
          ),
          primaryColor: kcPrimaryColor,
          fontFamily: GoogleFonts.mulish().fontFamily,
          inputDecorationTheme: const InputDecorationTheme(),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: kcPrimaryColor,
            selectionHandleColor: kcPrimaryColor,
            selectionColor: kcPrimaryColor.withValues(alpha: .4),
          ),
        ),
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver],
      ),
    );
  }
}
