import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
      child: Card(
        color: kLightPrimaryColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: Icon(
                  Icons.person,
                  size: 24,
                ),
              ),
              Text(
                'username'.toUpperCase(),
                style: Styles.textStyle14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
