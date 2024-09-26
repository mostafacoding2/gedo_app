import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ItemNotification extends StatelessWidget {
  const ItemNotification({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        margin: EdgeInsetsDirectional.only(bottom: 16.h),
        height: 70.h,
        width: 327.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(8),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Color.fromRGBO(191, 214, 215, 0.6))
            ]),
        child: widget);
  }
}
