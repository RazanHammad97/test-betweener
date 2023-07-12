import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static OutlineInputBorder primaryRoundedOutlineInputBorder =
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: kPrimaryColor, width: 2));

  static TextStyle titleStyle = GoogleFonts.roboto(
      fontSize: 24.sp, fontWeight: FontWeight.w600, color: kPrimaryColor);
  static TextStyle textStyle = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle textStyle14 = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: kPrimaryColor);
  static TextStyle profileContenairLinkesStyle =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400);
}
