import 'package:ashtar/components/appbar_custom.dart';
import 'package:ashtar/screens/dashboard_screen/components/announcement.dart';
import 'package:ashtar/screens/dashboard_screen/components/banner.dart';
import 'package:ashtar/screens/dashboard_screen/components/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 10.h, right: 5.w, left: 5.w),
        child:  Column(
          children: [
            const BannerCustom(),
            SizedBox(height: 10.h,),
            SizedBox(
              height: .5.sh,
              child: Row(
                children: [
                  Flexible(
                      flex: 3,
                      child: Announcement()),
                  Flexible(
                      flex: 1,
                      child: Quiz())
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
