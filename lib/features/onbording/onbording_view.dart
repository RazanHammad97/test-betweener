import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../pref/shared_pref.dart';
import '../main_app/main_app_view.dart';

class OnBoardingView extends StatelessWidget {
  static String id = '/onBoardingView';

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInLeft(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              SvgPicture.asset(AssetsData.onBoardingImage),
              Text(
                'Just one Scan for everything',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SecondaryButtonWidget(
                text: 'Get Started',
                width: double.infinity,
                onTap: () {
                  String rout = SharedPrefController().LoggedIn
                      ? MainAppView.id
                      : LoginView.id;
                  Navigator.pushReplacementNamed(context, rout);
                },
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
