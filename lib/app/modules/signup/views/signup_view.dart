import 'package:aipower/app/modules/signup/controllers/checkbox_controller.dart';
import 'package:aipower/app/modules/signup/controllers/hiddenpass_controller.dart';
import 'package:aipower/app/modules/signup/views/widget/custom_checkbox.dart';
import 'package:aipower/app/modules/signup/views/widget/custom_rich.dart';
import 'package:aipower/app/routes/app_pages.dart';
import 'package:aipower/common/widgets/custom_textfield/custom_textfield.dart';
import 'package:aipower/app/modules/signup/views/widget/or_divider.dart';
import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:aipower/common/widgets/custom_buttons/custom_elevated.dart';
import 'package:aipower/common/widgets/custom_buttons/google_signup.dart';
import 'package:aipower/utils/pictures/icons/icons.dart';
import 'package:aipower/utils/sizes/styles.dart';
import 'package:aipower/utils/text/text.dart';
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
    final PassController passCtrl = Get.find<PassController>();
    final TextEditingController passwordCtrl = TextEditingController();
    final TextEditingController confirmPasswordCtrl = TextEditingController();
    final CheckboxController checkboxCtrl = Get.find<CheckboxController>();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: CustomScaffold(
        child: SingleChildScrollView(
          padding: UPadding.screenPadding,
          child: Form(
            key: _formKey,
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
                      fillColor: Color(0xFF004C92),
                      hintText: UText.signUpPersonFieldText,
                      hintStyle: UTextStyles.title14_w400(color: Colors.white),
                      upLabelText: UText.signUpPersonFieldLabelText,
                      upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                      textStyle:  UTextStyles.title14_w400(color: Colors.white),
                      prefixIcon: Padding(
                        padding:  EdgeInsets.all(12),
                        child: SvgPicture.asset(UIcons.signUpPersonFieldPrefixIcon),
                      ),
                      /*validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your Name";
                        }
                      },*/
                    ),

                    SizedBox(height: 10.h),

                    //------------email textField--------------

                    CustomInputField(
                      fillColor: Color(0xFF004C92),
                      hintText: UText.signUpEmailFieldText,
                      hintStyle: UTextStyles.title14_w400(color: Colors.white),
                      upLabelText: UText.signUpEmailFieldLabelText,
                      upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                      textStyle:  UTextStyles.title14_w400(color: Colors.white),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(UIcons.signUpEmailFieldPrefixIcon),
                      ),
                    /*  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }

                    // Universal email regex (Gmail, Yahoo, Outlook, Company domains, etc.)
                    bool isValid = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value);

                    if (!isValid) {
                      return "Email Needed";
                    }

                    return null;
                  },*/
                    ),

                    SizedBox(height: 10.h),

                    //------------password textField--------------

                    Obx(
                          () => CustomInputField(
                        controller: passwordCtrl,
                        obscureText: passCtrl.isPasswordHidden.value,
                        fillColor: const Color(0xFF004C92),
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
                      textTwoStyle: GoogleFonts.inter(
                        fontSize: 12.sp, fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ) ,
                      onTap: () => Get.toNamed(Routes.TERMS_CONDITIONS_AND_PRIVACY_POLICY),
                    ),

                    //------------------ and, privacy policy---------------

                    CustomRichText(
                      textOne: UText.signUpSecondRichFirstText,
                      textOneStyle: UTextStyles.title26_w500(),
                      textTwo: UText.signUpSecondRichSecondText,
                      textTwoStyle: GoogleFonts.inter(
                      fontSize: 12.sp, fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ) ,
                      onTap: () => Get.toNamed(Routes.TERMS_CONDITIONS_AND_PRIVACY_POLICY),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                //------------------sing up button---------------------

                CustomElevated(
                    text: UText.signUpButtonText,
                    onPressed: (){
                      // Form validation first
                      if (_formKey.currentState!.validate()) {
                        // Hide error if user checked
                        checkboxCtrl.showError.value = false;
                        // 🔥 Checkbox validation
                        if (!checkboxCtrl.isChecked.value) {
                          checkboxCtrl.showError.value =
                          true; // Show error under checkbox
                          return; // Stop signup
                        }
                        Get.snackbar(
                          "Success",
                          "Signup successfully!",
                          snackPosition: SnackPosition.TOP,
                          colorText: Colors.black,
                          backgroundColor: Colors.transparent,
                        );
                        Get.toNamed(Routes.HOME);
                      } else {
                        // Form field errors
                        Get.snackbar(
                          "Error",
                          "Please correct all fields",
                          colorText: Colors.black,
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.transparent,
                        );
                      }
                    },
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
                  textTwoStyle: GoogleFonts.inter(
                    fontSize: 13.sp, fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ) ,
                  onTap: () => Get.toNamed(Routes.LOGIN),
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

