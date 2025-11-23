import 'package:aipower/app/routes/app_pages.dart';
import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:aipower/common/widgets/custom_buttons/custom_elevated.dart';
import 'package:aipower/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../utils/sizes/styles.dart';
import '../controllers/backtologin_controller.dart';

class BacktologinView extends GetView<BacktologinController> {
  const BacktologinView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        child: SingleChildScrollView(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              SizedBox(height: 400.h),

              //--------------------Title -----------------------
              Text(
                  UText.confirmPassTitle,
                style: UTextStyles.title24_w600(color: Colors.white),
              ),

              SizedBox(height: 6.h),

              //-------------------subtitle-----------------------

              Text(
                  UText.confirmPassSubTitle,
                style: UTextStyles.title25_w500(color: Colors.white),
              ),

              SizedBox(height: 50.h),

              //---------------------Back to login-----------------
              CustomElevated(
                  text: UText.confirmPassButtonText,
                  onPressed: () => Get.toNamed(Routes.LOGIN)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
