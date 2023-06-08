import 'package:ashtar/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ashtar/utility/app_colors.dart';
import 'package:ashtar/utility/app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      this.title = '',
      this.onPress,
      this.titleFontSize = 12,
      this.titleFontColor = Colors.white,
      this.borderRadius = 15,
      this.backgroundColor = AppColors.mainColor,
      this.borderColor = Colors.transparent})
      : super(key: key);
  final String title;
  final double titleFontSize;
  final Color titleFontColor;
  final double borderRadius;
  final Function? onPress;
  final Color backgroundColor, borderColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          elevation: MaterialStateProperty.all(5),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r)))),
      onPressed: onPress != null
          ? () {
              onPress!();
            }
          : null,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: titleFontSize,
              color: titleFontColor,
              height: 2,
              fontFamily: AppFonts.mainfont),
        ),
      ),
    );
  }
}
