import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  final RxBool value;
  final RxBool showError;
  final VoidCallback onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.showError,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged();
        if (value.value) showError.value = false; // hide error when checked
      },
      child: Obx(
            () => Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
            color: value.value
                ?  Colors.transparent
                : null,
            borderRadius: BorderRadius.circular(4),
            /// 🔥 If unchecked & showError = true → Red Border
            border: Border.all(
              color: showError.value
                  ? Colors.red
                  : Colors.white,
              width: 1.4,
            ),
          ),
          child: value.value
              ? Icon(Icons.check, size: 14, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}
