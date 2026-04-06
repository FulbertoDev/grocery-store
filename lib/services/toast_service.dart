import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';
import 'package:velocity_x/velocity_x.dart';

import '../app/app.logger.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/ui_helpers.dart';

class ToastService {
  String? _currentNotificationId;
  final logger = getLogger("ToastService");

  Future<ToastificationItem> showErrorNotification(
      {required String message}) async {
    return await _showNotification(
      type: ToastificationType.error,
      message: message,
    );
  }

  Future<ToastificationItem> showSuccessNotification(
      {required String message}) async {
    return await _showNotification(
      type: ToastificationType.success,
      message: message,
    );
  }

  Future<ToastificationItem> _showNotification({
    required ToastificationType type,
    required String message,
  }) async {
    if (_currentNotificationId != null) {
      dismissNotificationById(_currentNotificationId!);
    }
    var color = switch (type) {
      ToastificationType.success => kcGreen400Color,
      ToastificationType.error => Vx.red600,
      _ => Vx.teal100,
    };
    HapticFeedback.mediumImpact();

    final item = toastification.showCustom(
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(baseline_10x),
            color: kcGray800Color,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: baseline_1x_5,
            vertical: semiBaseline,
          ),
          margin: const EdgeInsets.all(baseline),
          child: Row(
            children: [
              Icon(
                switch (type) {
                  ToastificationType.success => Icons.check_circle,
                  ToastificationType.error => Icons.error_rounded,
                  _ => Icons.info,
                },
                color: color,
              ),
              message.text.semiBold.white.make().px12().expand(),
              const Icon(Icons.close_rounded, color: Vx.white).p4().onTap(() {
                toastification.dismiss(holder);
              }),
            ],
          ),
        );
      },
    );
    _currentNotificationId = item.id;
    return item;
  }

  void dismissNotificationById(String id) {
    toastification.dismissById(id, showRemoveAnimation: true);
    _currentNotificationId = null;
  }
}
