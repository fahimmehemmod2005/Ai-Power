import 'package:aipower/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../utils/pictures/images/images.dart';
import '../../../../utils/sizes/styles.dart';
import '../../../../utils/text/text.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    final SplashController Controller = Get.find<SplashController>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ScaffoldColor.mainGradient
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(UImages.splashText, height: 26.48.w, width: 114.45.h),
              SizedBox(height: 14.h),
              Text(textAlign: TextAlign.center,UText.splashSubTitle,
                style: UTextStyles.title23_w500(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
