import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget? child;
  const CustomScrollBar({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.white), // scrollbar color
          trackColor: MaterialStateProperty.all(Colors.white24), // track color
          thickness: MaterialStateProperty.all(7), // scrollbar width
          radius: Radius.circular(10),// rounded thumb
        ),
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          child: SingleChildScrollView(
              child: child
          ),
        ),
      ),
    );
  }
}