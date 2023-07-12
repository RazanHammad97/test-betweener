
import 'package:bootcamp_starter/core/helper/context_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/link_api_controller.dart';
import '../../../core/helper/helper.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';
import '../../../models/api_ressponse.dart';
import '../../edit_link/edit_link.dart';
import '../links/models/link_model.dart';

class LinkContainer extends StatefulWidget {
  const LinkContainer({
    super.key,
    required this.user,
  });
  final List<Link>? user;

  @override
  State<LinkContainer> createState() => _LinkContainerState();
}

class _LinkContainerState extends State<LinkContainer> with Helpers {
  @override
  Widget build(BuildContext context) {
    void updateUi() {
      setState(() {});
    }

    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        itemCount: widget.user!.length,
        itemBuilder: (context, index) {
          var ContainerColor = Color(0xffFEE2E7);
          var titleColor = Color(0xff783341);
          var subTitleColor = Color(0xff9B6A73);
          if (index % 2 != 0) {
            ContainerColor = Color(0xffE7E5F1);
            titleColor = kPrimaryColor;
            subTitleColor = Color(0xff807D99);
          }
          return Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Container(
                height: 60.h,
                width: 285.w,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.edit_rounded, color: Colors.white),
              ),
            ),
            secondaryBackground: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Container(
                height: 60.h,
                width: 285.w,
                decoration: BoxDecoration(
                    color: kDangerColor,
                    borderRadius: BorderRadius.circular(10.r)),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                delete(id: widget.user![index].id!);
              }
              if (direction == DismissDirection.startToEnd) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(),
                    builder: (context) => EditLink(
                      user: widget!.user![index],
                    ),
                  ),
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Container(
                height: 60.h,
                width: 285.w,
                decoration: BoxDecoration(
                    color: ContainerColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget!.user![index].title!,
                        style: Styles.profileContenairLinkesStyle.copyWith(
                          color: titleColor,
                        ),
                      ),
                      Text(
                        widget!.user![index].link!,
                        style: Styles.profileContenairLinkesStyle.copyWith(
                          color: subTitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void delete({required int id}) async {
    ApiResponse processResponse = await LinkApiController().deleteLink(id: id);
    if (processResponse.sucess) {}
    context.showSnakBar(
      message: processResponse.msg,
      error: !processResponse.sucess,
    );
  }
}
