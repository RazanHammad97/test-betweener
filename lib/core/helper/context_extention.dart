import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/constants.dart';

extension ContextExtention on BuildContext {
  void showSnakBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 60.h,
            decoration: BoxDecoration(
                color: error ? kDangerColor : Color(0xff0A6EBD),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        message,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 20),
                      ),
                    ],
                    totalRepeatCount: 4,
                  ),
                ),
              ],
            ),
          ),

          // SvgPicture.asset("images/svg/error.svg",height: 48,width: 40,color: Colors.white,)
        ],
      ),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: const Duration(
        seconds: 3,
      ),
    ));

    // ScaffoldMessenger.of(this).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       message,
    //       style: GoogleFonts.poppins(),
    //     ),
    //     backgroundColor: error ? Colors.red.shade700 : Colors.blue.shade300,
    //     duration: Duration(seconds: 3),
    //     dismissDirection: DismissDirection.horizontal,
    //   ),
    // );
  }
}
