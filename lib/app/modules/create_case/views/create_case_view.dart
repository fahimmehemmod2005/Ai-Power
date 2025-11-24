import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../utils/pictures/icons/icons.dart';
import '../../../../utils/sizes/styles.dart';
import '../../../../utils/text/text.dart';
import '../controllers/create_case_controller.dart';

class CreateCaseView extends GetView<CreateCaseController> {
  const CreateCaseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        child: SingleChildScrollView(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),

              // --------------------- Back button  Title ------------------------------

              Row(
                children: [

                  // --------------------- Back button ------------------------------

                  GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      UIcons.termsConditionBackIcon,
                      height: 34.h,
                      width: 34.w,
                    ),
                  ),

                  SizedBox(width: 25.w),

                  // ---------------------Title ------------------------------

                  Text(
                    textAlign: TextAlign.center,
                    UText.termsAndConditionTitleText,
                    style: UTextStyles.title27_w600(color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }
}
