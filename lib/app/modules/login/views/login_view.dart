import 'package:aipower/app/modules/signup/views/widget/custom_checkbox.dart';
import 'package:aipower/app/modules/signup/views/widget/custom_rich.dart';
import 'package:aipower/app/modules/signup/views/widget/or_divider.dart';
import 'package:aipower/app/routes/app_pages.dart';
import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:aipower/common/widgets/custom_buttons/custom_elevated.dart';
import 'package:aipower/common/widgets/custom_buttons/google_signup.dart';
import 'package:aipower/common/widgets/custom_textfield/custom_textfield.dart';
import 'package:aipower/utils/pictures/images/images.dart';
import 'package:aipower/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/pictures/icons/icons.dart';
import '../../../../utils/sizes/styles.dart';
import '../../signup/controllers/checkbox_controller.dart';
import '../../signup/controllers/hiddenpass_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final PassController passController = Get.find<PassController>();
    final TextEditingController passwordCtrl = TextEditingController();
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

                SizedBox(height: 94.h),

                //-------------------Clamea Image-----------------

                Column(
                  children: [
                    SvgPicture.asset(
                      UImages.splashText,
                      height: 26.48.h,
                      width: 114.45.w,
                    ),
                  ],
                ),

                SizedBox(height: 72.h),

                //------------------- email ----------------------

                CustomInputField(
                  height: 44.h,
                  width: double.infinity,
                  fillColor: Color(0xFF004C92),
                  borderRadius: 30,
                  hintText: UText.loginEmailFieldHintText,
                  hintStyle: UTextStyles.title14_w400(color: Colors.white),
                  upLabelText: UText.loginEmailFieldLabelText,
                  upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                  textStyle:  UTextStyles.title14_w400(color: Colors.white),
                  prefixIcon: Padding(
                    padding:  EdgeInsets.all(12),
                    child: SvgPicture.asset(UIcons.loginEmailFieldPrefixIcon),
                  ),
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }

                    // Universal email regex (Gmail, Yahoo, Outlook, Company domains, etc.)
                    bool isValid = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value);

                    if (!isValid) {
                      return "Email doesn’t registered to any account";
                    }

                    return null;
                  },*/
                ),

                SizedBox(height: 10.h),

                //-------------- password ---------------------

                Obx(
                      () => CustomInputField(
                    controller: passwordCtrl,
                    height: 44.h,
                    width: double.infinity,
                    obscureText: passController.isPasswordHidden.value,
                    fillColor: Color(0xFF004C92),
                    borderRadius: 30,
                    hintText: UText.loginPassFieldHintTExt,
                    hintStyle: UTextStyles.title14_w400(color: Colors.white),
                    upLabelText: UText.loginPassFieldLabelText,
                    upLabelStyle: UTextStyles.title12_w400(color: Colors.white),
                    textStyle: UTextStyles.title14_w400(color: Colors.white),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: SvgPicture.asset(UIcons.loginPassFieldPrefixIcon),
                    ),
                    onChanged: (value) {
                      passController.password.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () => passController.togglePassword(),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          passController.isPasswordHidden.value
                              ? UIcons.loginPassFieldSuffixIcon
                              : UIcons.loginPassShowFieldSuffixIcon,
                        ),
                      ),
                    ),
                      /*  validator: (value) {
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

                //---------------Checkbox, remember me and forgot button --------------------

                Row(
                  children: [

                    //-------------------checkbox-------------------------

                    CustomCheckbox(
                      value: checkboxCtrl.isChecked,
                      showError: checkboxCtrl.showError,
                      onChanged: () {
                        checkboxCtrl.isChecked.toggle();
                      },
                    ),

                    SizedBox(width: 10.w),

                    //-----------------Remember me ------------------

                    Text(UText.loginRememberMeText,
                    style: UTextStyles.title12_w400(color: Colors.white),
                    ),

                    Spacer(),

                    //--------------------Forgot button-----------------

                        GestureDetector(
                            onTap: () => Get.toNamed(Routes.FORGOTVIEWS),
                            child: Text(UText.loginForgotPass,
                            style: UTextStyles.title12_w400(color: Colors.white),)),
                  ],
                ),

                SizedBox(height: 30.h),

                //------------------Login Button-------------------

                CustomElevated(
                    text: UText.loginButtonText,
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          "Success",
                          "Login successfully!",
                          snackPosition: SnackPosition.TOP,
                          colorText: Colors.black,
                          backgroundColor: Colors.white,
                        );
                        Get.toNamed(Routes.HOME);
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please correct all fields",
                          colorText: Colors.black,
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.white,
                        );
                      }
                    },
                ),

                SizedBox(height: 30.h),

                OrDivider(
                  lineColor: Colors.white,
                  thickness: 1,
                  spacing: 8,
                  child: Text(UText.signUpDividerText,style: UTextStyles.title26_w500(color: Colors.white),),
                ),

                SizedBox(height: 30.h),

                //--------------------OR----------------------

                CustomGoogleButton(
                    icon: SvgPicture.asset(UIcons.loginGoogleButton),
                    text: UText.loginGoogleButtonText,
                    textStyle: UTextStyles.title25_w500(color: Color(0xff257ABF)),
                    onPressed: (){}),

                SizedBox(height: 30.h),

                //-------------------Don't have an account? Sign Up-----------------

                CustomRichText(
                    textOne: UText.loginRichFirstText,
                    textTwo: UText.loginRichSecondText,
                  textTwoStyle: GoogleFonts.inter(
                    fontSize: 13.sp, fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ) ,
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
