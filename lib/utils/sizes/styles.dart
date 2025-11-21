import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UTextStyles{
  UTextStyles._();

  static TextStyle title26_w600({Color? color}) => GoogleFonts.inter(fontSize: 26.sp, fontWeight: FontWeight.w600, color: color,);
  static TextStyle title14_w500({Color? color}) => GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500, color: color,);
  static TextStyle title14_w400({Color? color}) => GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: color,);
  static TextStyle title16_w500({Color? color}) => GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: color);
  static TextStyle title20_w500({Color? color}) => GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w500, color: color);
  static TextStyle title16_w800({Color? color}) => GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w800, color: color);
  static TextStyle title16_w600({Color? color}) => GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600, color: color);
  static TextStyle title16_w400({Color? color}) => GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400, color: color);
  static TextStyle title10_w500({Color? color}) => GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w500, color: color);
  static TextStyle title12_w400({Color? color}) => GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w400, color: color);
  static TextStyle title12_w600({Color? color}) => GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w600, color: color);
  static TextStyle title20_w600({Color? color}) => GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w600, color: color);
  static TextStyle title22_w600({Color? color}) => GoogleFonts.inter(fontSize: 22.sp, fontWeight: FontWeight.w600, color: color);
  static TextStyle title23_w500({Color? color}) => GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w500, color: color);
  static TextStyle title24_w600({Color? color}) => GoogleFonts.nunito(fontSize: 24.sp, fontWeight: FontWeight.w600, color: color);
  static TextStyle title25_w500({Color? color}) => GoogleFonts.nunito(fontSize: 14.sp, fontWeight: FontWeight.w500, color: color);
  static TextStyle title26_w500({Color? color}) => GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: color);

}

  extension TextStyleExtension on TextStyle {
    TextStyle withColor(Color color) => copyWith(color: color);
}
