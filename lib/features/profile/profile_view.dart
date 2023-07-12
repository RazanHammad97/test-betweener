import 'package:animate_do/animate_do.dart';
import 'package:bootcamp_starter/features/edit_user_info/edit_user_info.dart';
import 'package:bootcamp_starter/features/profile/widget/link_container.dart';
import 'package:bootcamp_starter/features/profile/widget/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/util/api_response.dart';
import '../../core/util/constants.dart';
import '../../core/util/styles.dart';
import '../add_link/add_link.dart';
import 'links/providers/link_provider.dart';

class ProfileView extends StatelessWidget {
  static const id = '/profileView';

  final bool Function(UserScrollNotification)? onNotification;

  const ProfileView({super.key, this.onNotification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Profile',
            style: Styles.titleStyle, textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Column(
          children: [
            SizedBox(height: 36.h),
            FadeInRight(
              child: ProfileContainer(onPressed: () {
                Navigator.pushNamed(context, EditUserInfo.id);
              }),
            ),
            SizedBox(
              height: 24.h,
            ),
            Consumer<LinkProvider>(
              builder: (_, linkProvider, __) {
                if (linkProvider.linkList.status == Status.LOADING) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (linkProvider.linkList.status == Status.ERROR) {
                  return Center(
                    child: Text('${linkProvider.linkList.message}'),
                  );
                }
                print(linkProvider.linkList.data?.length);
                return Center(
                    child: LinkContainer(
                  user: linkProvider.linkList.data,
                ));
              },
            ),
            FadeInRight(
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AddLink.id);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: kPrimaryColor),
                      child: const Icon(
                        Icons.add_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
