import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserInfo extends StatelessWidget {
  static String id = '/EditUserInfo';

  TextEditingController nameController = TextEditingController(text: 'ss');
  TextEditingController emailController =
      TextEditingController(text: 'ss@ss.com');
  TextEditingController passwordController = TextEditingController(text: '123');

  EditUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User Info"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FadeInLeft(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 24.h),
            child: Column(
              children: [
                SizedBox(
                  child: Image.network(
                    'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/4_avatar-512.png',
                    width: 150.w,
                  ),
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
                  controller: emailController,
                  hint: '0000',
                  label: 'Phone',
                ),
                SizedBox(
                  height: 14.h,
                ),
                SecondaryButtonWidget(
                  width: 100.w,
                  onTap: () {},
                  text: 'Save ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
