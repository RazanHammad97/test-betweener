import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/helper/context_extention.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/primary_outlined_button_widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/auth_api_controller.dart';
import '../../models/api_ressponse.dart';
import '../../models/logged_user.dart';
import '../home/home_view.dart';
import 'widgets/google_button_widget.dart';

class LoginView extends StatefulWidget {
  static String id = '/loginView';

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInLeft(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      child: Hero(
                          tag: 'authImage',
                          child: SvgPicture.asset(AssetsData.authImage))),
                  const Spacer(),
                  PrimaryLabeledTextFieldWidget(
                    controller: emailController,
                    hint: 'example@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: passwordController,
                    hint: 'Enter password',
                    label: 'password',
                    password: true,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        )
                      : SecondaryButtonWidget(
                          onTap: () {
                            performLogin();
                          },
                          text: 'LOGIN'),
                  SizedBox(
                    height: 24.h,
                  ),
                  PrimaryOutlinedButtonWidget(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterView.id);
                      },
                      text: 'REGISTER'),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    '-  or  -',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GoogleButtonWidget(onTap: () {}),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      setState(() {
        loading = true;
      });
      login();
    }
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      _controlErrorValue();
      return true;
    }
    _controlErrorValue();

    return false;
  }

  void _controlErrorValue() {
    setState(
      () {},
    );
  }

  void login() async {
    bool statues = await AuthApiController().login(user: user);
    if (statues) {
      Navigator.pushNamed(context, MainAppView.id);
    } else {
      context.showSnakBar(
        message: 'Invalid Credential',
        error: false,
      );
    }
    setState(() {
      loading = false;
    });
  }

  LogedUser get user {
    LogedUser user = LogedUser();
    user.email = emailController.text;
    user.password = passwordController.text;

    return user;
  }
}
