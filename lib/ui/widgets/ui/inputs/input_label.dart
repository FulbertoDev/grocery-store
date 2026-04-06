import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class InputLabel extends StatelessWidget {
  final String text;
  final bool isRequired;
  final Color? labelColor;

  const InputLabel({
    super.key,
    required this.text,
    this.isRequired = false,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return text.richText.semiBold
        .color(labelColor ?? Vx.hexToColor("#171B1E"))
        .lg
        .withTextSpanChildren([
      //if (isRequired) ' *'.textSpan.bold.color(Vx.red600).make(),
    ]).make();
  }
}
