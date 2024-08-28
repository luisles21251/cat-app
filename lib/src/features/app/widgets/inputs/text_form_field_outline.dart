import 'package:cat_flutter_project/src/core/settings/app_colors.dart';
import 'package:cat_flutter_project/src/core/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldOutline extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final TextInputType keyboardType;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final FocusNode? focusNode;
  final bool? obscureText;
  final int? maxLength;
  final Widget? counter;
  final bool enabledBorder;
  final GestureTapCallback ? gestureTapCallback;
  final TextStyle? style;
  final bool filled;
  final Color? fillColor;
  final TextCapitalization textCapitalization;
  final Widget?  customError;
  final String ? prefixText;
  final VoidCallback ? onFinishEdit;

  const TextFormFieldOutline({
    Key? key,
    this.hintText = "",
    @required this.controller,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.enabled= true,
    this.inputFormatters,
    this.suffixIcon,
    this.onTap,
    this.gestureTapCallback,
    this.focusNode,
    this.obscureText = false,
    this.maxLength,
    this.counter,
    this.enabledBorder = false,
    this.style,
    this.filled = false,
    this.fillColor,
    this.textCapitalization =TextCapitalization.none,
    this.customError,
    this.prefixText,
    this.onFinishEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onFieldSubmitted:(string)=> gestureTapCallback,
          onEditingComplete: onFinishEdit,
          obscureText: obscureText!,
          focusNode: focusNode,
          onTap: onTap,
          enabled: enabled,
          keyboardType: keyboardType,
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          style: style,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            prefixText:prefixText ,
            filled: filled,
            fillColor: fillColor,
            counter: counter,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.only(
              left: 15,
              top: 15.0,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.pTextPlaceholder),
            enabledBorder: customOutlineInputBorder(enabledBorder),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.pBorder),
            ),
          ),
          onChanged: onChanged,
          autovalidateMode: customError != null ? AutovalidateMode.disabled:  AutovalidateMode.onUserInteraction,
          validator: validator,
          inputFormatters: inputFormatters,
        ),
        customError !=  null ? Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: customError!,
        ) : const SizedBox(),
      ],
    );
  }
}
