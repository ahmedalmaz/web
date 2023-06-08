import 'package:ashtar/utility/all_app_words.dart';
import 'package:ashtar/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {Key? key, required this.search, required this.controller})
      : super(key: key);
  final Function search;
  final TextEditingController controller;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: TextFormField(
              controller: widget.controller,
              cursorColor: AppColors.mainColor,
              autofocus: false,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                widget.search(value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(left: 20.w,right: 20.w),
                prefixIcon: Icon(Icons.search,
                    color: AppColors.greenColor, size: 22.spMin),
                hintText: AppWords.search.tr,
                hintStyle:
                    TextStyle(fontSize: 14.spMin, color: AppColors.greyColor),
                // fillColor: Colors.red,
                // filled: true,
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
