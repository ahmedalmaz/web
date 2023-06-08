import 'package:ashtar/screens/dashboard_screen/components/dashboard.dart';
import 'package:ashtar/screens/dashboard_screen/dash_board_data.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with DashboardData {
  @override
  void initState() {
    // TODO: implement initState
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            title: SizedBox(
              height: 120.h,
            ),
            controller: sideMenu,
            showToggle: true,
            style: SideMenuStyle(
              itemHeight: 70.h,
                selectedColor: Colors.white,
                unselectedIconColor: Colors.white,
                unselectedTitleTextStyle: TextStyle(color: Colors.white),
                selectedIconColor: Colors.teal,
                selectedTitleTextStyle: TextStyle(color: Colors.teal),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.teal, Colors.teal.withOpacity(.8)]),
                )),

            // List of SideMenuItem to show them on SideMenu
            items: items,
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Dashboard(),
               SizedBox(),
               SizedBox(),
               SizedBox(),
               SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
