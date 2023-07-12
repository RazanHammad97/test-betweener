import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bootcamp_starter/core/helper/context_extention.dart';
import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:bootcamp_starter/features/profile/links/providers/link_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/link_api_controller.dart';
import '../../core/helper/helper.dart';
import '../../core/util/constants.dart';
import '../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../models/api_ressponse.dart';

class AddLink extends StatefulWidget {
  AddLink({super.key});
  static String id = '/AddLink';

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> with Helpers {
  final TextEditingController _textTitleController = TextEditingController();

  final TextEditingController _textLinkController = TextEditingController();

  final TextEditingController _textUserNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Add Link",
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
                        hint: 'Title',
                        keyboardType: TextInputType.emailAddress,
                        label: 'Title',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      PrimaryLabeledTextFieldWidget(
                        controller: _textUserNameController,
                        hint: 'User Name',
                        keyboardType: TextInputType.text,
                        label: 'User Name',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      PrimaryLabeledTextFieldWidget(
                        controller: _textLinkController,
                        hint: 'Link',
                        keyboardType: TextInputType.emailAddress,
                        label: 'Link',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      SecondaryButtonWidget(
                        width: 100.w,
                        onTap: () {
                          performAddingLink();
                        },
                        text: 'Add ',
                      ),
                    ],
                  ))),
        ));
  }

  void performAddingLink() {
    if (checkData()) {
      setState(() {});
      addLink();
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

  void addLink() async {
    ApiResponse processResponse = await LinkApiController().addLinks(
        title: _textTitleController.text,
        link: _textLinkController.text,
        username: _textUserNameController.text);
    if (processResponse.sucess) {
      context.showSnakBar(
        message: processResponse.msg,
        error: !processResponse.sucess,
      );
      _textUserNameController.clear();
      _textLinkController.clear();
      _textTitleController.clear();
      LinkProvider().fetchLinkList();
    }
  }
}
