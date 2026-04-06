import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/app_enums.dart';
import '../../../common/ui_helpers.dart';
import 'input_label.dart';

class CustomInput extends HookWidget {
  final String? hintText,
      label,
      errorMessage,
      helperMessage,
      successMessage,
      dialCode,
      initialValue;

  final void Function(String?)? onNeededFunction;

  final void Function(String?)? onValueChanged;

  final Widget? icon, suffixIcon;

  final Color? fillColor, borderColor, labelColor;

  final TextEditingController? controller;

  final bool isRequired;

  final bool isEnabled;

  final bool isFocusable;

  final TextInputType keyboardType;

  final TextInputAction? textInputAction;

  final InputType variant;

  final FocusNode? focusNode;

  final List<TextInputFormatter>? inputFormatters;

  final void Function()? onSubmitted;
  final void Function()? onEnter;

  final int? maxLength;

  const CustomInput({
    super.key,
    this.hintText,
    this.controller,
    this.icon,
    this.suffixIcon,
    this.labelColor,
    this.fillColor,
    this.label,
    this.initialValue,
    this.errorMessage,
    this.helperMessage,
    this.successMessage,
    this.focusNode,
    this.maxLength,
    this.variant = InputType.basic,
    this.isRequired = true,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.onNeededFunction,
    this.onValueChanged,
    this.onSubmitted,
    this.isEnabled = true,
    this.isFocusable = true,
    this.dialCode,
    this.borderColor,
    this.textInputAction,
    this.onEnter,
  });

  bool get hasError => errorMessage != null;

  bool get isPasswordInput =>
      keyboardType == TextInputType.visiblePassword ||
      variant == InputType.password;

  bool get isPhoneNumberInput => variant == InputType.phone;

  @override
  Widget build(BuildContext context) {
    var obscureText = useState(isPasswordInput);
    var shouldObscureText = obscureText.value;

    final initialController = initialValue != null
        ? useTextEditingController(text: initialValue)
        : null;

    return [
      if (label != null)
        InputLabel(
          text: label!,
          isRequired: isRequired,
          labelColor: labelColor,
        ).pOnly(bottom: semiBaseline),
      AbsorbPointer(
              absorbing: !isFocusable || !isEnabled,
              child: TextField(
                canRequestFocus: isFocusable,
                onTapOutside: (_) => onSubmitted?.call(),
                onTap: onEnter,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: baseline,
                    right: baseline,
                    top: semiBaseline,
                  ),
                  prefixIcon: icon,
                  isDense: true,
                  filled: true,
                  hoverColor: Colors.transparent,
                  fillColor: Colors.transparent,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Vx.black.withValues(alpha: .5),
                  ),
                  border: InputBorder.none,
                  suffixIcon: isPasswordInput
                      ? IconButton(
                          onPressed: () {
                            obscureText.value = !obscureText.value;
                          },
                          icon: Icon(
                            shouldObscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Vx.hexToColor("#6B7280"),
                          ),
                        )
                      : suffixIcon != null
                          ? [suffixIcon!]
                              .vStack(alignment: MainAxisAlignment.center)
                          : null,
                ),
                obscureText: shouldObscureText,
                obscuringCharacter: '*',
                focusNode: focusNode,
                controller: controller ?? initialController,
                inputFormatters: [
                  if (inputFormatters != null) ...inputFormatters!,
                  if (keyboardType == TextInputType.number)
                    FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType:
                    isPhoneNumberInput ? TextInputType.number : keyboardType,
                minLines: 1,
                maxLines: 1,
                readOnly: !isEnabled,
                onChanged: (value) {
                  if (keyboardType ==
                      const TextInputType.numberWithOptions(decimal: true)) {
                    String text = value.replaceAll(",", ".");
                    bool textContainsTwoDots = text.split(".").length > 2;
                    if (textContainsTwoDots) {
                      text = "${text.split(".")[0]}.${text.split(".")[1]}";
                    }
                    controller!.text = text;
                    onValueChanged?.call(text);
                  } else {
                    onValueChanged?.call(value);
                  }
                },
                style: TextStyle(
                  fontSize: baseline_2x,
                  fontWeight: FontWeight.w500,
                  color: hasError ? Vx.hexToColor("#F05252") : null,
                ),
              ).py(9).h(baseline_6x))
          .box
          .border(
              color: hasError ? Vx.red500 : Vx.hexToColor("#82CD47"),
              width: 1.5)
          .color(
            hasError ? Vx.hexToColor("#FDF2F2") : Colors.white,
          )
          .withRounded(value: baseline)
          .make(),
      InputMessage(
        message: errorMessage,
        isSuccess: false,
      ),
      InputMessage(
        message: successMessage,
        isSuccess: true,
      ),
      if (helperMessage != null && !hasError)
        helperMessage!.text
            .minFontSize(baseline)
            .sm
            .color(labelColor ?? Vx.hexToColor("#6B7280"))
            .make()
            .pOnly(top: semiBaseline),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}

class InputMessage extends StatelessWidget {
  final bool isSuccess;
  final String? message;

  const InputMessage({
    super.key,
    this.message,
    this.isSuccess = true,
  });

  @override
  Widget build(BuildContext context) {
    if (message == null) return const SizedBox.shrink();

    return message!.text.semiBold
        .color(Vx.hexToColor(isSuccess ? '#287D3C' : '#F05252'))
        .make()
        .pOnly(top: baseline);
  }
}
