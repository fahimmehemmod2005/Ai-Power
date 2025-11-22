import 'package:aipower/common/padding/padding.dart';
import 'package:aipower/common/widgets/CustomScaffold/custom_scaffold.dart';
import 'package:aipower/utils/pictures/icons/icons.dart';
import 'package:aipower/utils/pictures/images/images.dart';
import 'package:aipower/utils/sizes/styles.dart';
import 'package:aipower/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/widgets/custom_buttons/custom_elevated.dart';
import '../../../../common/widgets/custom_textfield/custom_textfield.dart';
import '../../../routes/app_pages.dart';
import '../../signup/views/widget/custom_rich.dart';
import '../controllers/forgot_views_controller.dart';

class ForgotView extends GetView<ForgotViewsController> {
  const ForgotView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body:CustomScaffold(
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

                    //--------------- clamea--------------

                Center(
                    child: SvgPicture.asset(
                        UImages.splashText,
                      height: 26.45.h,
                      width: 114.45.w,
                  ),
                ),

                SizedBox(height: 160.h),

                //--------------Title and subtitle-----------------------

                Column(
                  children: [

                    //---------------------title--------------------

                     Text(
                       UText.forgotTitle,
                       style: UTextStyles.title24_w600(color: Colors.white),),

                    SizedBox(height: 5.h),

                     //--------------------subtitle--------------------

                     Text(
                       textAlign: TextAlign.center,
                         UText.forgotSubTitle,
                     style: UTextStyles.title25_w500(color: Colors.white),
                     ),
                  ],
                ),

                SizedBox(height: 50.h),

                //--------------------Email Text Field---------------------

                CustomInputField(
                  fillColor: Color(0xFF004C92),
                  hintText: UText.forgotEmailFieldHintText,
                  hintStyle: UTextStyles.title14_w400(color: Colors.white),
                  upLabelText: UText.forgotEmailFieldLabelText,
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

                SizedBox(height: 30.w),

                //---------------Send code button------------------

                CustomElevated(
                  text: UText.forgotSendCodeButtonText,
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(Routes.OTP);
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
                
                SizedBox(height: 30.w),
                
                //-------------------Remember you password? login----------------------
                
                Center(
                  child: CustomRichText(
                    textOne: UText.forgotRichFirstText,
                    textTwo: UText.forgotRichSecondText,
                    textTwoStyle: GoogleFonts.inter(
                      fontSize: 13.sp, fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ) ,
                    onTap: () => Get.toNamed(Routes.LOGIN),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
