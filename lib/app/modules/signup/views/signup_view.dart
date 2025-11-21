import 'package:aipower/app/modules/multi/views/multi_view.dart';
import 'package:aipower/app/modules/signup/controllers/checkbox_controller.dart';
import 'package:aipower/app/modules/signup/controllers/hiddenpass_controller.dart';
import 'package:aipower/app/modules/signup/views/widget/custom_checkbox.dart';
import 'package:aipower/app/modules/signup/views/widget/custom_rich.dart';
import 'package:aipower/app/modules/signup/views/widget/custom_textfield.dart';
import 'package:aipower/app/modules/signup/views/widget/or_divider.dart';
import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:aipower/common/widgets/custom_buttons/custom_elevated.dart';
import 'package:aipower/common/widgets/custom_buttons/google_signup.dart';
import 'package:aipower/utils/pictures/icons/icons.dart';
import 'package:aipower/utils/sizes/styles.dart';
import 'package:aipower/utils/text/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final PassController passController = Get.find<PassController>();
    final TextEditingController passwordCtrl = TextEditingController();
    final TextEditingController confirmPasswordCtrl = TextEditingController();
    final CheckboxController checkboxCtrl = Get.find<CheckboxController>();
    return Scaffold(
      body: CustomScaffold(
        child: SingleChildScrollView(
          padding: UPadding.screenPadding,
          child: Column(
            children: [

              //----------------- Title and Subtitle-----------------

              Column(
                children: [
                  SizedBox(height: 89.h),
                  Text(UText.signUpTitle,style: UTextStyles.title24_w600(color: Colors.white),),
                  Text(UText.signUpSubTitle,style: UTextStyles.title25_w500(color: Colors.white),),
                ],
              ),
              
              SizedBox(height: 30.h),
              
              //---------------Text Form Fields-----------------
              
              Column(
                children: [

                  //------------person textField--------------

                  CustomInputField(
                    height: 44.h,
                    width: double.infinity,
                    fillColor: Color(0xFF004C92),
                    borderRadius: 30,
                    hintText: UText.signUpEmailFieldText,
                    hintStyle: UTextStyles.title14_w400(color: Colors.white),
                    upLabelText: UText.signUpEmailFieldLabelText,
                    upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                    textStyle:  UTextStyles.title14_w400(color: Colors.white),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(UIcons.signUpPersonFieldPrefixIcon),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  //------------email textField--------------

                  CustomInputField(
                    height: 44.h,
                    width: double.infinity,
                    fillColor: Color(0xFF004C92),
                    borderRadius: 30,
                    hintText: UText.signUpEmailFieldText,
                    hintStyle: UTextStyles.title14_w400(color: Colors.white),
                    upLabelText: UText.signUpEmailFieldLabelText,
                    upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                    textStyle:  UTextStyles.title14_w400(color: Colors.white),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(UIcons.signUpEmailFieldPrefixIcon),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  //------------password textField--------------

                  Obx(
                        () => CustomInputField(
                      controller: passwordCtrl,
                      height: 44.h,
                      width: double.infinity,
                      obscureText: passController.isPasswordHidden.value,
                      fillColor: const Color(0xFF004C92),
                      borderRadius: 30,
                      hintText: UText.signUpNewPassFieldText,
                      hintStyle: UTextStyles.title14_w400(color: Colors.white),
                      upLabelText: UText.signUpNewPassFieldLabelText,
                      upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                      textStyle: UTextStyles.title14_w400(color: Colors.white),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(UIcons.signUpPassFieldPrefixIcon),
                      ),
                      onChanged: (value) {
                        passController.password.value = value;
                      },
                      suffixIcon: GestureDetector(
                        onTap: () => passController.togglePassword(),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            passController.isPasswordHidden.value
                                ? UIcons.signUpPassFieldSuffixIcon
                                : UIcons.signUpShowPassFieldSuffixIcon,
                          ),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 10.h),

                  //------------Confirm password textField--------------

                  Obx(
                        () => CustomInputField(
                      controller: confirmPasswordCtrl,
                      height: 44.h,
                      width: double.infinity,
                      obscureText: passController.isConfirmPasswordHidden.value,
                      fillColor: const Color(0xFF004C92),
                      borderRadius: 30,
                      hintText: UText.signUpNewPassFieldText,
                      hintStyle: UTextStyles.title14_w400(color: Colors.white),
                      upLabelText: UText.signUpNewConfirmPassFieldLabelText,
                      upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                      textStyle: UTextStyles.title14_w400(color: Colors.white),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(UIcons.signUpPassFieldPrefixIcon),
                      ),
                      onChanged: (value) {
                        passController.confirmPassword.value = value;
                      },
                      suffixIcon: GestureDetector(
                        onTap: () => passController.toggleConfirmPassword(),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            passController.isConfirmPasswordHidden.value
                                ? UIcons.signUpConfirmPassFieldSuffixIcon
                                : UIcons.signUpShowConfirmPassFieldSuffixIcon,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(height: 10.h),

              //------------------checkbox and terms & conditions rich----------------

              Row(
                children: [

                  //-------------checkbox----------------

                  CustomCheckbox(
                    value: checkboxCtrl.isChecked,
                    showError: checkboxCtrl.showError,
                    onChanged: () {
                      checkboxCtrl.isChecked.toggle();
                    },
                  ),

                  SizedBox(width: 5.w),

                  //---------------i agree with you, terms & conditions----------------

                  CustomRichText(
                      textOne: UText.signUpFirstRichFirstText,
                      textOneStyle: UTextStyles.title26_w500(),
                      textTwo: UText.signUpFirstRichSecondText,
                    textTwoStyle: UTextStyles.title26_w500(),
                    onTap: (){},
                  ),

                  //------------------ and, privacy policy---------------

                  CustomRichText(
                    textOne: UText.signUpSecondRichFirstText,
                    textOneStyle: UTextStyles.title26_w500(),
                    textTwo: UText.signUpSecondRichSecondText,
                    textTwoStyle: UTextStyles.title26_w500(),
                    onTap: (){},
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              //------------------sing up button---------------------

              CustomElevated(
                  text: UText.signUpButtonText,
                  onPressed: (){}
              ),

              SizedBox(height: 20.h),
              
              //-------------------OR---------------------
              
              OrDivider(
                lineColor: Colors.white,
                thickness: 1,
                spacing: 8,
                child: Text(UText.signUpDividerText,style: UTextStyles.title26_w500(color: Colors.white),),
              ),

              SizedBox(height: 20.h),

              //---------------Google signup----------------

              CustomGoogleButton(
                icon: SvgPicture.asset(UIcons.signUpGoogleButton),
                text: UText.signUpGoogleButtonText,
                  textStyle: UTextStyles.title25_w500(color: Color(0xff257ABF)),
                  onPressed: (){}
              ),

              SizedBox(height: 20.h),

              // ------------already have an account Rich--------------------

              CustomRichText(
                  textOne: UText.signUpThirdRichFirstText,
                  textTwo: UText.signUpThirdRichSecondText,
                onTap: (){},
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

