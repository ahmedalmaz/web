import 'package:ashtar/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:ashtar/screens/signin_signup_screen/signin_signup_screen.dart';
import 'package:ashtar/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
part 'app_navigator.dart';

//add page routes here

appRoutes() {
  var routes = {
    ScreenNames.defaultScreen: (context) => const SplashScreen(),
    ScreenNames.signinSignupScreen: (context) => const SigninSignupScreen(),
    ScreenNames.dashboardScreen: (context) => const DashboardScreen(),
  };
  return routes;
}

class ScreenNames {
  static const String defaultScreen = "/";
  static const String signinSignupScreen = "signinSignupScreen";
  static const String dashboardScreen = "dashboardScreen";
}
