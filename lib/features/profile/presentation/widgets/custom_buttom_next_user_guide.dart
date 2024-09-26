import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomNextBottom extends StatelessWidget {
  const CustomNextBottom({super.key,this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap ,
      child: Container(height: 48.h,width: 100.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),color: AppColors.primaryColor),
        child: Center(child: Text("التالي" , style: Theme.of(context).textTheme.bodySmall!.apply(fontSizeFactor: 1.sp ,color: AppColors.myWhite),),),
      ),
    );
  }
}
