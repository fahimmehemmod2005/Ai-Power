import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;

  // Validator
  final String? Function(String?)? validator;

  // Top label
  final String? upLabelText;
  final TextStyle? upLabelStyle;

  // Input field label
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

  //  NEW: Error border properties
  final Color? errorBorderColor;
  final double errorBorderRadius;

  // Layout
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  final Function(String)? onChanged;
  final FocusNode? focusNode;

  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.validator,
    this.upLabelText,
    this.upLabelStyle,
    this.labelText,
    this.labelStyle,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.backgroundColor,
    this.borderColor,

    // NEW DEFAULTS
    this.errorBorderColor = Colors.red,
    this.errorBorderRadius = 30,

    this.height = 44,
    this.width = double.infinity,
    this.borderRadius = 30,
    this.contentPadding,
    this.onChanged,
    this.focusNode,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (upLabelText != null) ...[
          Text(upLabelText!, style: upLabelStyle),
          SizedBox(height: 5.h),
        ],

        Container(
          height: height.h,
          width: width == double.infinity ? width : width.w,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius.r),
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
              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

              // Normal border removed (Container is used)
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius.r),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius.r),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.transparent,
                ),
              ),

              //  ERROR BORDER (user requested)
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(errorBorderRadius.r),
                borderSide: BorderSide(color: errorBorderColor!, width: 1.5),
              ),

              /// 🔥 FOCUSED ERROR BORDER
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(errorBorderRadius.r),
                borderSide: BorderSide(color: errorBorderColor!, width: 1.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
