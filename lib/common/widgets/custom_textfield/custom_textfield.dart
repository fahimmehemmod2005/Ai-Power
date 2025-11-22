import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;

  ///Validator
  final String? Function(String?)? validator;

  /// Top label
  final String? upLabelText;
  final TextStyle? upLabelStyle;

  /// Input field label
  final String? labelText;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomInputField({
    super.key,
    this.validator,
    required this.hintText,
    required this.upLabelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.backgroundColor,
    this.borderColor,
    this.height,
    this.width,
    this.borderRadius = 30,
    this.contentPadding,
    this.onChanged,
    this.focusNode,
    this.hintStyle,
    this.textStyle,
    this.labelStyle,
    this.labelText,
    this.upLabelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Label
        Text(
          upLabelText!, style: upLabelStyle,
        ),
        SizedBox(height: 5.h),

        // Input Field Container
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          child: TextFormField(
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: obscureText ? 1 : maxLines,
            onChanged: onChanged,
            focusNode: focusNode,
            style: textStyle,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: labelStyle,
              hintText: hintText,
              hintStyle: hintStyle,
              filled: fillColor != null,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: contentPadding,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
