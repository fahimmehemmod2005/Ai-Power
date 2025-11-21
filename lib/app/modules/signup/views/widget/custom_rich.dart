import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final TextStyle? textOneStyle;
  final TextStyle? textTwoStyle;
  final VoidCallback? onTap;
  final TextAlign textAlign;

  const CustomRichText({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.textOneStyle,
    this.textTwoStyle,
    this.onTap,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(

      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: textOne,
            style: textOneStyle,
          ),
          TextSpan(
            text: textTwo,
            style: textTwoStyle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
