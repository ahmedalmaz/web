import 'package:ashtar/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCustom extends StatefulWidget {
  const BannerCustom({Key? key}) : super(key: key);

  @override
  State<BannerCustom> createState() => _BannerCustomState();
}

class _BannerCustomState extends State<BannerCustom> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      child: Container(
        width: double.infinity,
        height: .32.sh,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.r)),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'E',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2A4C58)),
                  ),
                  TextSpan(
                    text: 'X',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2A4C58).withOpacity(.9)),
                  ),
                  TextSpan(
                    text: 'A',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4A696F)),
                  ),
                  TextSpan(
                    text: 'M',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff598285)),
                  ),
                  TextSpan(
                    text: 'S',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff739594)),
                  ),
                  TextSpan(
                    text: '  ',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2A4C58)),
                  ),
                  TextSpan(
                    text: 'T',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7C9EA0)),
                  ),
                  TextSpan(
                    text: 'I',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7C9B9B)),
                  ),
                  TextSpan(
                    text: 'M',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff87B6B0)),
                  ),
                  TextSpan(
                    text: 'E',
                    style: TextStyle(
                        fontSize: 13.spMax,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff90BAB6)),
                  ),
                ])),
                SizedBox(
                  width: .4.sw,
                  child: Text(
                    'Here we are . are you ready to fight ? don’t worry. we prepared some tips to \nbe ready for our exams',
                    style: TextStyle(color: Colors.grey,fontSize: 14.spMin),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50.h,
                  width: .18.sw,
                  child: AppButton(
                    backgroundColor: Color(0xff48CCC0),
                    title: 'View Exams Tips',
                    titleFontSize: 22.spMin,
                    onPress: (){},
                  ),
                ),
                SizedBox(height: 20.h,)
              ],
            ),

            Spacer(),
            Image.asset(
              'assets/images/graphic.jpg',
              width: .3.sw,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}
