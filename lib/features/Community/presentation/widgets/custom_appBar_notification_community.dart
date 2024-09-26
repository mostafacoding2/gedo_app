import 'package:alzcare/core/utils/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class CustomAppBarNotificationCommunity extends StatelessWidget {
  const CustomAppBarNotificationCommunity({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 155.h,
          width: double.infinity.w,
          child: SvgPicture.asset(
            fit: BoxFit.fill,
            ImagesPath.curvynotification,
          ),
        ),
        PositionedDirectional(
          start: 24.w,end: 24.w,
          bottom: 67.h,
          child: widget,
        ),

        PositionedDirectional(
          top: 11.h,
          start: 53.w,
          child:Container(
            height: 36.h,width: 36.w,
            decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.61),borderRadius: BorderRadius.circular(360)),),
        ),
        PositionedDirectional(
          top: 9.h,
          start: 226.r,
          child: Container(
            height: 24.h,width: 24.w,
            decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.23),borderRadius: BorderRadius.circular(360)),),

        ),

        PositionedDirectional(
          top: 88.h,
          start: 80.r,
          child: Container(
            height: 16.h,width: 16.w,
            decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.22),borderRadius: BorderRadius.circular(360)),),
        ),

        PositionedDirectional(
          top: 54.h,
          start: 172.2.r,
          child:Container(
            height: 36.h,width: 36.w,
            decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.4),borderRadius: BorderRadius.circular(360)),),

        ),



        PositionedDirectional(
          top: 67.h,
          start: 302.r,
          child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.24)),
        ),
      ],
    );
  }
}
