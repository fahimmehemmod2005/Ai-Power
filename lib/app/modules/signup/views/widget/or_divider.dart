import 'package:flutter/material.dart';


class OrDivider extends StatelessWidget {
  // final String text;
  final Widget? child;
  final Color? lineColor;
  final double? thickness;
  final double? spacing;

  const OrDivider({
    Key? key,
    // this.text = 'OR',
    this.child,
    this.lineColor,
    this.thickness,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: thickness,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing!),
          child: child,
        ),
        Expanded(
          child: Divider(
            color: lineColor ?? Colors.grey[300],
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}