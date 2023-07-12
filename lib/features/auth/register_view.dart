import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/helper/context_extention.dart';
import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/auth_api_controller.dart';
import '../../core/util/constants.dart';
import '../../models/logged_user.dart';
import '../main_app/main_app_view.dart';
import 'login_view.dart';
import 'widgets/google_button_widget.dart';

class RegisterView extends StatefulWidget {
  static String id = '/registerView';

  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: FadeInLeft(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              child: Column(
                children: [
                  const Spacer(),
                  FadeInRight(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Hero(
                            tag: 'authImage',
                            child: SvgPicture.asset(AssetsData.authImage))),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: nameController,
                    hint: 'John Doe',
                    label: 'Name',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  PrimaryLabeledTextFieldWidget(
                    controller: emailController,
                    hint: 'example@gmail.com',
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
                            performRegister();
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

  void performRegister() {
    setState(() {
      loading = true;
      register();
    });
  }

  void register() async {
    bool statues = await AuthApiController().register(user: user);
    if (statues) {
      Navigator.pushNamed(context, LoginView.id);
    } else {
      context.showSnakBar(
        message: 'Invalid Credential',
        error: true,
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
    user.name = nameController.text;
    user.confirm = passwordController.text;
    return user;
  }
}
