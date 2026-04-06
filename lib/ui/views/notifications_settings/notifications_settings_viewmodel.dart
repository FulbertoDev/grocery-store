import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked/stacked.dart';

class NotificationsSettingsViewModel extends BaseViewModel {
  bool _isNotificationEnabled = false;
  bool get isNotificationEnabled => _isNotificationEnabled;

  bool _isEmailAlertsEnabled = false;
  bool get isEmailAlertsEnabled => _isEmailAlertsEnabled;

  bool _isOrderAlertsEnabled = false;
  bool get isOrderAlertsEnabled => _isOrderAlertsEnabled;

  bool _isProductRecommendationsEnabled = false;
  bool get isProductRecommendationsEnabled => _isProductRecommendationsEnabled;

  void toggleNotification() {
    _isNotificationEnabled = !_isNotificationEnabled;
    notifyListeners();

    if (_isNotificationEnabled) {
      _displayLocalNotifications();
    }
  }

  void toggleEmailAlerts() {
    _isEmailAlertsEnabled = !_isEmailAlertsEnabled;
    notifyListeners();
  }

  void toggleOrderAlerts() {
    _isOrderAlertsEnabled = !_isOrderAlertsEnabled;
    notifyListeners();
  }

  void toggleProductRecommendations() {
    _isProductRecommendationsEnabled = !_isProductRecommendationsEnabled;
    notifyListeners();
  }

  void _displayLocalNotifications() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    InitializationSettings initializationSettings =
        const InitializationSettings(iOS: initializationSettingsDarwin);
    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
    );
    await flutterLocalNotificationsPlugin.show(
      id: Random.secure().nextInt(999),
      title: 'Grocery Store',
      body:
          'We have received your order #${Random.secure().nextInt(999)} and it is being processed.',
    );
  }
}
