import 'package:aipower/utils/sizes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevated extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color backgroundColor;
  final double height;
  final double width;
  final Color borderColor;

  const CustomElevated({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 35.0,
    this.backgroundColor = Colors.white,
    this.height = 44.0,
    this.width = double.infinity,
    this.borderColor = Colors.transparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w ,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor,),
          ),
        ),
        child: Text(text, style: UTextStyles.title16_w500(color: Color(0xff257ABF)
          ),
        ),
      ),
    );
  }
}
