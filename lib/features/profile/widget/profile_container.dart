import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126.h,
      width: 285.w,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding:
            EdgeInsets.only(right: 18.w, left: 24.w, bottom: 21.h, top: 21.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              radius: 42.r,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 14.0.w, top: 8.h, bottom: 8.h, right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: Styles.textStyle,
                  ),
                  Text(
                    'example@gmail.com',
                    style: Styles.textStyle.copyWith(fontSize: 12.sp),
                  ),
                  Text(
                    '+9700000000',
                    style: Styles.textStyle.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onPressed,
              child: Icon(
                Icons.edit_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
