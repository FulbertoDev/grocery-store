import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';

class AppRaisedButton extends StatelessWidget {
  final String label;
  final Color labelColor, backgroundColor;
  final bool isBusy, isEnabled;
  final void Function() onPressed;
  final double borderRadius;
  const AppRaisedButton({
    super.key,
    required this.label,
    this.labelColor = Colors.white,
    this.backgroundColor = const Color(0xff82CD47),
    this.isBusy = false,
    this.isEnabled = true,
    required this.onPressed,
    this.borderRadius = baseline,
  });

  const AppRaisedButton.primary({
    super.key,
    required this.label,
    this.labelColor = Colors.white,
    this.backgroundColor = kcPrimaryColor,
    this.isBusy = false,
    this.isEnabled = true,
    required this.onPressed,
    this.borderRadius = baseline,
  });

  const AppRaisedButton.inverted({
    super.key,
    required this.label,
    this.backgroundColor = Colors.white,
    this.labelColor = kcPrimaryColor,
    this.isBusy = false,
    this.isEnabled = true,
    this.borderRadius = baseline,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: baseline_6x_5,
      width: double.infinity,
      child: (isBusy
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(labelColor),
                  strokeWidth: quaterBaseline,
                ).wh(baseline_3x, baseline_3x).centered()
              : label.text
                  .color(!isEnabled ? Vx.hexToColor("#6B7280") : labelColor)
                  .lg
                  .semiBold
                  .makeCentered())
          .box
          .color(!isEnabled ? Vx.hexToColor("#E5E7EB") : backgroundColor)
          .withRounded(value: borderRadius)
          .border(
              color: !isEnabled ? Vx.hexToColor("#E5E7EB") : backgroundColor,
              width: quaterBaseline)
          .make()
          .onTap(() {
        if (isEnabled && !isBusy) onPressed.call();
      }),
    );
  }
}
