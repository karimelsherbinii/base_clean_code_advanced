import 'package:flutter/material.dart';
import 'package:teach_me/config/routes/app_route.dart';
import 'package:teach_me/core/api/cache_helper.dart';
import 'package:teach_me/core/utils/app_strings.dart';
import 'package:teach_me/core/utils/assets_manager.dart';
import 'package:teach_me/core/utils/media_query_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuthenticated =
      CacheHelper.getData(key: AppStrings.accessToken) ?? false;

  goToNext() async =>
      Future.delayed(const Duration(seconds: 2)).then((value) => isAuthenticated
          ? Navigator.pushNamed(context, Routes.homeScreen)
          : Navigator.pushNamed(context, Routes.signInScreen));
  @override
  void initState() {
    super.initState();
    goToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: context.width,
            child: Image.asset(
              AppAssets.splash,
              fit: BoxFit.cover,
            )));
  }
}
