import 'package:ashtar/helper/lang.dart';
import 'package:ashtar/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCMCOShxoxLgEsuWX5trDVPTdKmpe44SDo',
        appId: '1:917246133471:web:5cd6f500bab0ddc037156a',
        messagingSenderId: '917246133471',
        storageBucket: 'taxi-82034.appspot.com',
        databaseURL: 'https://taxi-82034-default-rtdb.firebaseio.com',
        authDomain: 'taxi-82034.firebaseapp.com',
        projectId: 'taxi-82034',
        measurementId: 'G-D264BPCXCT'),
  );
  Locale currentLocale = await Lang.getDefaultOrStoredLocal();

  runApp(MyApp(
    currentLocale: currentLocale,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.currentLocale}) : super(key: key);
  final Locale? currentLocale;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, widget) => GetMaterialApp(
        locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        initialRoute: ScreenNames.defaultScreen,
        routes: appRoutes(),
        fallbackLocale: Locale('en'),
        translations: Lang(),
      ),
    );
  }
}
