import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/util/constants.dart';

class GoogleButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final double? width;

  const GoogleButtonWidget({
    super.key,
    required this.onTap,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: kRedColor, width: 2.w)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          width: width,
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.only(
                right: 12.0.w, left: 12.0.w, bottom: 12.0.h, top: 12.0.h),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: kRedColor,
                ),
                Spacer(),
                Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                      color: kRedColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
