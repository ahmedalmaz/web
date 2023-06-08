
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ashtar/helper/validation.dart';
import 'package:ashtar/utility/app_colors.dart';
import 'package:ashtar/utility/image_path.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
        this.inputType = TextInputType.text,
        this.labelText = '',
        this.hintText = '',
        this.textFieldValidType = TextFieldvalidatorType.Required,
        this.controller,
        this.iconData,
        this.confirmPasswordController,
        this.firstPasswordToConfirm,
        this.maxLength,
        this.enabled = true,
        required this.onTap,
        this.obscureText = false,
        this.maxlines = 1})
      : super(key: key);

  final TextInputType inputType;
  final String labelText;
  final String hintText;
  final TextFieldvalidatorType textFieldValidType;
  final TextEditingController? controller;
  final String? iconData;
  final TextEditingController? confirmPasswordController;
  final String? firstPasswordToConfirm;
  final bool obscureText;
  final int? maxLength;
  final bool enabled;
  final Function onTap;
  final int maxlines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool secure = false;

  @override
  void initState() {
    // TODO: implement initState
    secure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: widget.inputType,
        maxLines: widget.maxlines,
        controller: widget.controller,
        enabled: widget.enabled,
        onTap: () {
          widget.onTap();
        },
        onFieldSubmitted: (text) {

        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.mainColor,
        obscureText: secure,
        style: TextStyle(color: Colors.black54, fontSize: 16.spMin),
        keyboardAppearance: Brightness.dark,
        validator: (v) => validation(
            type: widget.textFieldValidType,
            value: v!,
            firstPAsswordForConfirm: widget.textFieldValidType ==
                TextFieldvalidatorType.ConfirmPassword
                ? widget.confirmPasswordController!.value.text
                : ""),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 12.spMin, color: Colors.black54),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(left: 5.w, right: 5.w),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(widget.maxlines > 1 ? 10.r : 50.r),
            gapPadding: 0,
          ),
          suffixIcon: widget.textFieldValidType ==
              TextFieldvalidatorType.Password ||
              widget.textFieldValidType ==
                  TextFieldvalidatorType.ConfirmPassword
              ? GestureDetector(
            onTap: () {
              setState(() {
                secure = !secure;
              });
            },
            child: Padding(
                padding: EdgeInsets.all(12.h),
                child: SvgPicture.asset(
                  !secure ? AppImages.hide : AppImages.show,
                  width: 12.w,
                  height: 10.h,
                )),
          )
              : widget.textFieldValidType == TextFieldvalidatorType.PhoneNumber
              ?SizedBox()
              : null,
          errorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(widget.maxlines > 1 ? 10.r : 50.r),
              gapPadding: 0,
              borderSide: const BorderSide(width: 2, color: Colors.red)),
          prefixIcon: widget.iconData != null
              ? Padding(
              padding: EdgeInsets.all(12.h),
              child: SvgPicture.asset(
                widget.iconData!,
                width: 15.w,
                height: 10.h,
              ))
              : null,
        ),
      ),
    );
  }
}
