import 'package:ashtar/utility/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {Key? key,
      required this.link,
      this.enableShow = true,
      this.boxFit = BoxFit.cover})
      : super(key: key);
  final String link;
  final bool enableShow;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: link,
      fit: boxFit,
      errorWidget: (contex, string, d) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          // border: Border.all(color: Color(0xff6A1244))
        ),
        child: Center(
            child: Image.asset(
          'assets/images/re.jpg',
          width: double.infinity,
          fit: BoxFit.cover,
        )),
      ),
      placeholder: (context, _) => const Center(
        child: CupertinoActivityIndicator(
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}

// showDialog(
// context: context,
// builder: (context) {
// return SimpleDialog(
// contentPadding: EdgeInsets.zero,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.r)),
// children: [
// Container(
// height: .8.sh,
// width: .8.sw,
// clipBehavior: Clip.antiAlias,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10.r)),
// child: InteractiveViewer(
// panEnabled: false, // Set it to false to prevent panning.
// boundaryMargin: EdgeInsets.all(80),
// minScale: 1,
// maxScale: 4,
// child: CachedNetworkImage(
// imageUrl: link,
// fit: BoxFit.cover,
// errorWidget: (contex, string, d) => Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10.r),
// // border: Border.all(color: Color(0xff6A1244))
// ),
// child: Center(
// child: Image.asset(
// 'assets/images/re.jpg',
// width: double.infinity,
// fit: BoxFit.cover,
// )),
// ),
// placeholder: (context, _) => const Center(
// child: CupertinoActivityIndicator(
// color: AppColors.mainColor),
// ),
// ),
// ),
// )
// ],
// );
// });
