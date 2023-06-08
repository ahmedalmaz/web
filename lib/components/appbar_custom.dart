import 'package:ashtar/components/search_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as bdg;

class CustomAppBar extends PreferredSize {
  CustomAppBar( {
    Key? key,
  }) : super(
      key: key, child: Container(), preferredSize: Size.fromHeight(80.h));
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
      backgroundColor: Colors.blueGrey.shade50,
      title: Text(
        'Welcome, ${firebaseAuth.currentUser!.displayName}',
        style: TextStyle(
            fontSize: 25.spMin,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
      ),
      actions: [
        SizedBox(
            width: .2.sw,
            child: SearchTextField(search: (){},controller: TextEditingController())),
        SizedBox(width: 7.w,),
        bdg.Badge(
            badgeContent: Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            badgeColor: Colors.teal,
            alignment: Alignment.center,
            position: bdg.BadgePosition(top: 18.h, end: -5),
            child: Icon(Icons.notifications,
                size: 35.spMin, color: Colors.teal)),
        SizedBox(
          width: 5.w,
        ),
        bdg.Badge(
            badgeContent: Text(
              '5',
              style: TextStyle(color: Colors.white),
            ),
            badgeColor: Colors.teal,
            alignment: Alignment.center,
            position: bdg.BadgePosition(top: 18.h, end: -5),
            child: Icon(Icons.forward_to_inbox,
                size: 35.spMin, color: Colors.teal)),
        SizedBox(
          width: 5.w,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        SizedBox(
          width: 5.w,
        ),
      ],
    );

  }
}
