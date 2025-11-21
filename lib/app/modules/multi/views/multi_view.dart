import 'package:aipower/app/modules/multi/views/widget/customTextButton.dart';
import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/custom_buttons/custom_elevated.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/pictures/images/images.dart';
import '../../../../utils/sizes/styles.dart';
import '../../../../utils/text/text.dart';
import '../controllers/multi_controller.dart';

class MultiView extends GetView<MultiController> {
  const MultiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // --------------Title and sub title---------------

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      UImages.splashText,
                      height: 26.48.w,
                      width: 114.45.h,
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      textAlign: TextAlign.center,
                      UText.multiScreenSubTitle,
                      style: UTextStyles.title23_w500(color: Colors.white),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50.h),

              //-----------------Create an account button -----------------------

              CustomElevated(
                text: UText.multiScreenButtonText,
                onPressed: () {
                  Get.toNamed('/signup');
                },
              ),

              SizedBox(height: 30.h),

              //-----------------Login button button -----------------------

              Customtextbutton(
                  text: UText.multiScreenSecondButtonText,
                  onPressed: (){}
              )
            ],
          ),
        ),
      ),
    );
  }
}
