import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/core/helper/context_extention.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/link_api_controller.dart';
import '../../core/helper/helper.dart';
import '../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../models/api_ressponse.dart';

import '../profile/links/models/link_model.dart';
import '../profile/profile_view.dart';

class EditLink extends StatefulWidget {
  EditLink({super.key, required this.user});
  final Link user;

  @override
  State<EditLink> createState() => _EditLinkState();
}

class _EditLinkState extends State<EditLink> with Helpers {
  final TextEditingController _textTitleController = TextEditingController();

  final TextEditingController _textLinkController = TextEditingController();

  final TextEditingController _textUserNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textTitleController.text = widget.user!.title!;
    _textLinkController.text = widget.user.link!;
    _textUserNameController.text = widget.user.username!;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Edit",
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          backgroundColor: Colors.black45,
        ),
        body: FadeInLeft(
          child: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 80.h),
                  child: Column(
                    children: [
                      PrimaryLabeledTextFieldWidget(
                        controller: _textTitleController,
                        hint: widget.user.title,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Title',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      PrimaryLabeledTextFieldWidget(
                        controller: _textUserNameController,
                        hint: widget.user.username,
                        keyboardType: TextInputType.text,
                        label: 'User Name',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      PrimaryLabeledTextFieldWidget(
                        controller: _textLinkController,
                        hint: widget.user.link,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Link',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      SecondaryButtonWidget(
                        width: 100.w,
                        onTap: () {
                          performeditLink();
                        },
                        text: 'Save ',
                      ),
                    ],
                  ))),
        ));
  }

  void performeditLink() {
    if (checkData()) {
      setState(() {});
      editLink();
    }
  }

  bool checkData() {
    if (_textLinkController.text.isNotEmpty &&
        _textTitleController.text.isNotEmpty &&
        _textUserNameController.text.isNotEmpty) {
      return true;
    }

    showSnackBar(context, message: 'please enter data', erorr: true);

    return false;
  }

  void editLink() async {
    ApiResponse processResponse = await LinkApiController().editLinks(
        title: _textTitleController.text,
        link: _textLinkController.text,
        username: _textUserNameController.text,
        id: widget.user.id!);
    if (processResponse.sucess) {
      Navigator.pop(context);
      context.showSnakBar(
        message: processResponse.msg,
        error: !processResponse.sucess,
      );
      setState(() {});
    }
  }
}
