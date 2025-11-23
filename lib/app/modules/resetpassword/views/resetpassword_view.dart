import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_buttons/custom_elevated.dart';
import '../../../../common/widgets/custom_textfield/custom_textfield.dart';
import '../../../../utils/pictures/icons/icons.dart';
import '../../../../utils/pictures/images/images.dart';
import '../../../../utils/sizes/styles.dart';
import '../../../../utils/text/text.dart';
import '../../../routes/app_pages.dart';
import '../../signup/controllers/hiddenpass_controller.dart';
import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  const ResetpasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final PassController passCtrl = Get.find<PassController>();
    final TextEditingController passwordCtrl = TextEditingController();
    final TextEditingController confirmPasswordCtrl = TextEditingController();
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

                SizedBox(height: 98.h),

                //--------------check email and user Email-----------------------

                Center(
                  child: Column(
                    children: [
                      //---------------------Reset password--------------------
                      Text(
                        UText.resetPassTitle,
                        style: UTextStyles.title24_w600(color: Colors.white),
                      ),

                      SizedBox(height: 5.h),

                      //--------------------user Email--------------------
                      Text(
                        UText.resetPassSubTitle,
                        style: UTextStyles.title25_w500(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),

                //------------password textField--------------

                Obx(
                      () => CustomInputField(
                    controller: passwordCtrl,
                    obscureText: passCtrl.isPasswordHidden.value,
                    fillColor: const Color(0xFF004C92),
                    hintText: UText.resetPassNewPassFieldText,
                    hintStyle: UTextStyles.title14_w400(color: Colors.white),
                    upLabelText: UText.resetPassNewPassFieldLabelText,
                    upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                    textStyle: UTextStyles.title14_w400(color: Colors.white),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(UIcons.signUpPassFieldPrefixIcon),
                    ),
                    onChanged: (value) {
                      passCtrl.password.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () => passCtrl.togglePassword(),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          passCtrl.isPasswordHidden.value
                              ? UIcons.signUpPassFieldSuffixIcon
                              : UIcons.signUpShowPassFieldSuffixIcon,
                        ),
                      ),
                    ),
                    /*validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return "Password must contain at least 1 uppercase letter";
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return "Password must contain at least 1 lowercase letter";
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return "Password must contain at least 1 number";
                          }
                          if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                            return "Incorrect Password!";
                          }
                          return null;
                        },*/
                  ),
                ),


                SizedBox(height: 10.h),

                //------------Confirm password textField--------------

                Obx(
                      () => CustomInputField(
                    controller: confirmPasswordCtrl,
                    obscureText: passCtrl.isConfirmPasswordHidden.value,
                    fillColor: const Color(0xFF004C92),
                    hintText: UText.resetPassConfirmPassFieldText,
                    hintStyle: UTextStyles.title14_w400(color: Colors.white),
                    upLabelText: UText.resetPassConfirmPassFieldLabelText,
                    upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                    textStyle: UTextStyles.title14_w400(color: Colors.white),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(UIcons.signUpPassFieldPrefixIcon),
                    ),
                    onChanged: (value) {
                      passCtrl.confirmPassword.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () => passCtrl.toggleConfirmPassword(),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          passCtrl.isConfirmPasswordHidden.value
                              ? UIcons.signUpConfirmPassFieldSuffixIcon
                              : UIcons.signUpShowConfirmPassFieldSuffixIcon,
                        ),
                      ),
                    ),
                    /* validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Confirm password is required";

                              if (value != passCtrl.password.value)
                                return "Passwords do not match";

                              return null;
                            },*/
                  ),
                ),

                SizedBox(height: 30.h),

                CustomElevated(
                  text: UText.resetPassButtonText,
                  onPressed: (){
                    // if (_formKey.currentState!.validate()) {
                      // Get.snackbar(
                      //   "Success",
                      //   "Signup successfully!",
                      //   snackPosition: SnackPosition.TOP,
                      //   colorText: Colors.black,
                      //   backgroundColor: Colors.transparent,
                      // );
                      Get.toNamed(Routes.BACKTOLOGIN);
                    // } else {
                    //   Get.snackbar(
                    //     "Error",
                    //     "Fix all errors before continuing",
                    //     snackPosition: SnackPosition.TOP,
                    //     colorText: Colors.black,
                    //     backgroundColor: Colors.transparent,
                    //   );
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
