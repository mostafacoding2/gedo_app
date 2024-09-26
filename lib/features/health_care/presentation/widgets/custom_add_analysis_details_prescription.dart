import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAddAnalysisdetailsPrescription extends StatelessWidget {
  const CustomAddAnalysisdetailsPrescription({super.key,this.onTap});
 final void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
        EdgeInsetsDirectional.only(top: 535.r, start: 26.r,bottom: 5.r),
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadiusDirectional.circular(360),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Color.fromRGBO(95, 159, 160, 1))
            ]),
        child: Icon(
          Icons.add,
          color: AppColors.myWhite,
          size: 30,
        ),
      ),
    );
  }
}
