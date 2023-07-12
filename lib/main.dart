import 'package:bootcamp_starter/features/active_share/receive_view.dart';
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/auth/register_view.dart';
import 'package:bootcamp_starter/features/home/active_share/providers/ActiveShareProvider.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/features/onbording/onbording_view.dart';
import 'package:bootcamp_starter/features/profile/profile_view.dart';
import 'package:bootcamp_starter/pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/util/constants.dart';
import 'features/add_link/add_link.dart';
import 'features/edit_user_info/edit_user_info.dart';
import 'features/profile/links/providers/link_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();

  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LinkProvider>(
          create: (_) => LinkProvider(),
        ),
        ChangeNotifierProvider<ActiveShareProvider>(
          create: (_) => ActiveShareProvider(),
        ),
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Betweener',
            theme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: kPrimaryColor,
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                scaffoldBackgroundColor: kScaffoldColor),
            home: const OnBoardingView(),
            routes: {
              LoginView.id: (context) => LoginView(),
              RegisterView.id: (context) => RegisterView(),
              HomeView.id: (context) => const HomeView(),
              MainAppView.id: (context) => const MainAppView(),
              ProfileView.id: (context) => const ProfileView(),
              ReceiveView.id: (context) => const ReceiveView(),
              AddLink.id: (context) => AddLink(),
              EditUserInfo.id: (context) => EditUserInfo(),
            },
          );
        },
      ),
    );
  }
}
