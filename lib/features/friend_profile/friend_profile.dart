import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/util/constants.dart';

class FriendProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          "Ahmad ali",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp),
        ),
        centerTitle: true,
        toolbarHeight: 100.h,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FadeInLeft(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Column(
            children: [
              FadeInRight(
                child: Container(
                  width: 296.w,
                  height: 126.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.network(
                            'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/4_avatar-512.png',
                            width: 84.w,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "name",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "gmail",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 80.w,
                            height: 24.h,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kSecondaryColor,
                              ),
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              FadeInLeft(
                child: Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 15.w),
                      child: ListTile(
                        subtitle: const Text("link"),
                        title: const Text("AppName"),
                        onTap: () {},
                        tileColor: index % 2 == 0
                            ? kLightDangerColor
                            : kLightPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                    ),
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
