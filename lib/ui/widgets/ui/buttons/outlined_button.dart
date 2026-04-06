import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/ui_helpers.dart';

class AppOutlinedButton extends StatelessWidget {
  final String label;
  final Color labelColor, borderColor;
  final bool isBusy;
  final Function() onPressed;
  const AppOutlinedButton({
    super.key,
    required this.label,
    this.labelColor = kcPrimaryColor,
    this.borderColor = kcPrimaryColor,
    this.isBusy = false,
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
              : label.text.semiBold.lg.color(labelColor).makeCentered())
          .box
          .roundedSM
          .border(color: borderColor, width: quaterBaseline)
          .make()
          .onInkTap(onPressed),
    );
  }
}
