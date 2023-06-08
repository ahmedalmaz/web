import 'package:ashtar/components/app_button.dart';
import 'package:ashtar/model/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizItem extends StatelessWidget {
  const QuizItem({Key? key, required this.quiz}) : super(key: key);
  final QuizModel quiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/clock.svg',
              width: 5.w,
              color: Colors.teal,
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              quiz.name.toString(),
              style: TextStyle(fontSize: 16.spMin,fontWeight: FontWeight.bold,color: Colors.black54),
            )
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Text(
              'Course :',
              style: TextStyle(fontSize: 14.spMin,fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            SizedBox(width: 1.w,),
            Text(
              quiz.material.toString(),
              style: TextStyle(fontSize: 12.spMin,color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Text(
              'Description : ',
              style: TextStyle(fontSize: 14.spMin,fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            SizedBox(width: 1.w,),
            Text(
              quiz.desc.toString(),
              style: TextStyle(fontSize: 12.spMin,color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Text(
              'Date : ',
              style: TextStyle(fontSize: 14.spMin,fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            SizedBox(width: 1.w,),
            Text(
              quiz.date.toString(),
              style: TextStyle(fontSize: 12.spMin,color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 10.h,),
        SizedBox(
            height: 40.h,

            child: AppButton(
              borderRadius: 5.r,
              backgroundColor: Colors.white,
              borderColor: Colors.teal,
              title: 'Start Quiz',
              titleFontColor: Colors.teal,
              titleFontSize: 14.spMin,
            )),
        SizedBox(height: 10.h,),
      ],
    );
  }
}
