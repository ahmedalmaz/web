import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ashtar/screens/splash_screen/splash_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashData {
  @override
  void initState() {
    // TODO: implement initState

    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      _changeRotation();
    });
    routing();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRotation(
            turns: turns,
            duration: const Duration(milliseconds: 200),
            child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
