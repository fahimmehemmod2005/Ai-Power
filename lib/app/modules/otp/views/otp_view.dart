import 'package:aipower/app/modules/otp/views/widgets/custom_pinput.dart';
import 'package:aipower/app/modules/otp/views/widgets/otp_resend.dart';
import 'package:aipower/app/routes/app_pages.dart';
import 'package:aipower/common/widgets/custom_buttons/custom_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/padding/padding.dart';
import '../../../../common/widgets/CustomScaffold/custom_scaffold.dart';
import '../../../../utils/pictures/icons/icons.dart';
import '../../../../utils/pictures/images/images.dart';
import '../../../../utils/sizes/styles.dart';
import '../../../../utils/text/text.dart';
import '../controllers/otp_controller.dart';
import '../controllers/pinput_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final PinInputController pinController = Get.find<PinInputController>();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: CustomScaffold(
        child: SingleChildScrollView(
          padding: UPadding.screenPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 54.h),

                //---------------Back Button--------------

                GestureDetector(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset(
                    UIcons.forgotLeftArrow,
                    height: 34.h,
                    width: 34.w,
                  ),
                ),

                //--------------- clamea --------------

                Center(
                  child: SvgPicture.asset(
                    UImages.splashText,
                    height: 26.45.h,
                    width: 114.45.w,
                  ),
                ),

                SizedBox(height: 160.h),

                //--------------check email and user Email-----------------------

                Center(
                  child: Column(
                    children: [
                      //---------------------check email--------------------
                      Text(
                        UText.otpTitle,
                        style: UTextStyles.title24_w600(color: Colors.white),
                      ),

                      SizedBox(height: 5.h),

                      //--------------------user Email--------------------
                      Text(
                        UText.otpSubTitle,
                        style: UTextStyles.title25_w500(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),

                //--------------OTP Verification-----------------------

                Center(
                  child: CustomPinInput(
                    controller: pinController.pinController,
                    length: 4,
                    onCompleted: pinController.onPinCompleted, // FIXED
                    onChanged: pinController.onPinChanged,     // FIXED
                  ),
                ),



                SizedBox(height: 30.h),

                //-----------------Submit code with validation-----------

                Obx(
                      () => Opacity(
                    opacity: pinController.isPinComplete.value ? 1.0 : 0.5,
                    child: IgnorePointer(
                      ignoring: !pinController.isPinComplete.value,
                      child: CustomElevated(
                        text: UText.otpButtonText,
                        onPressed: () {
                          bool isVerified = pinController.submitPin();

                          if (isVerified) {
                            Get.toNamed(Routes.RESETPASSWORD);
                          }
                        },
                      ),
                    ),
                  ),
                ),



                SizedBox(height: 30.h),

                //-------------------Resend code------------------

                OtpResendText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}