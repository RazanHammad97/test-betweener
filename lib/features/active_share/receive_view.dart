import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/features/active_share/widgets/profile_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/assets.dart';
import '../../core/util/styles.dart';

class ReceiveView extends StatelessWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              right: 32.0.w, left: 32.0.w, bottom: 32.0.h, top: 32.0.h),
          child: Column(
            children: [
              Text(
                'Active Sharing',
                style: Styles.textStyle14.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 40.h,
              ),
              FadeInRight(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Hero(
                        tag: 'activeSharingImage',
                        child: Image.asset('assets/imgs/active_sharing.png'))),
              ),
              SizedBox(
                height: 34.h,
              ),
              FadeInLeft(child: const ProfilesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
