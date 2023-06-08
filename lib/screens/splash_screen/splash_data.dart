import 'dart:async';
import 'dart:html';

import 'package:ashtar/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SplashData {
  double turns = 0.0;
  late Timer timer;

  routing() async {
    Future.delayed(
      Duration(seconds: 2),
      () async {
        SharedPreferences ref = await SharedPreferences.getInstance();
        String? token=ref.getString('appToken');
        // final Storage localStorage = window.localStorage;
        // String? token = localStorage['appToken'];
        if (token != null) {
          goToWithRemoveRoute(screenName: ScreenNames.dashboardScreen);
        } else {
          goToWithRemoveRoute(screenName: ScreenNames.signinSignupScreen);
        }
      },
    );
  }
}
