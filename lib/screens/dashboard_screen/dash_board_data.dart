import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

mixin DashboardData {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  List<SideMenuItem> items = [
    SideMenuItem(
      priority: 0,
      title: 'Dashboard',
      icon: const Icon(Icons.home),
      onTap: (index, controller) {
        controller.changePage(index);
      },
    ),
    SideMenuItem(
      priority: 1,
      title: 'Schedule',
      onTap: (index, controller) {
        controller.changePage(index);
      },
      icon: Icon(Icons.calendar_month),
    ),
    SideMenuItem(
      priority: 2,
      title: 'Courses',
      onTap: (index, controller) {
        controller.changePage(index);
      },
      icon: Icon(Icons.menu_book),
    ),
    SideMenuItem(
      priority: 3,
      title: 'Performance',
      onTap: (index, controller) {
        controller.changePage(index);
      },
      icon: Icon(Icons.insert_invitation),
    ),
    SideMenuItem(
      priority: 4,
      title: 'Announcment',
      onTap: (index, controller) {
        controller.changePage(index);
      },
      icon: Icon(Icons.save),
    ),
  ];
}
