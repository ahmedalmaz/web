import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoaderItem extends StatefulWidget {
  const LoaderItem({Key? key}) : super(key: key);

  @override
  State<LoaderItem> createState() => _LoaderItemState();
}

class _LoaderItemState extends State<LoaderItem>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
