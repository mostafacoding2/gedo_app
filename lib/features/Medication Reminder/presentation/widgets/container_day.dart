import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class containerday extends StatelessWidget {
  const containerday(
      {super.key,
        required this.text,
        required this.onTap,
        required this.colorday});
  final String text;
  final Color colorday;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 4.r),
        width: 40.w,
        height: 30.h,
        decoration: BoxDecoration(
            color: colorday, borderRadius: BorderRadiusDirectional.circular(6)),
        child: Center(
            child: Text(
              text,
              style: lightTheme.textTheme.headlineLarge!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.dark,
              ),
            )),
      ),
    );
  }
}
