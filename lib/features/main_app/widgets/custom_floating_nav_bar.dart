import 'package:bootcamp_starter/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomFloatingNavBar(
      {super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.0.w, 0.h, 24.0.w, 24.0.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(size: 28),
          unselectedItemColor: Colors.grey.shade300,
          currentIndex: currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.emergency_share), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
          ],
        ),
      ),
    );
  }
}
