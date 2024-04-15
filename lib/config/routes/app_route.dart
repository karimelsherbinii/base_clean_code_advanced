import 'package:flutter/material.dart';

import 'package:teach_me/features/splash/presentation/screens/splash_screen.dart';

import '../../core/utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/homeScreen';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String otpScreen = '/otpScreen';
  static const String createNewPasswordScreen = '/createNewPasswordScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String courseDetailsScreen = '/courseDetailsScreen';
  static const String notificationsScreen = '/notificationsScreen';
  static const String qandAscreen = '/qandAscreen';
  static const String chattingScreen = '/chattingScreen';
  static const String trialTestScreen = '/trialTestScreen';
  static const String examScreen = '/examScreen';
  static const String examResultScreen = '/examResultScreen';
  static const String profileScreen = '/profileScreen';
  static const String categoryScreen = '/categoryScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

   
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
