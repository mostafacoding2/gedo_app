import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenItemWidget extends StatelessWidget {
  const HomeScreenItemWidget({
    super.key,
    required this.onTap,
    required this.imagePath,
     this.text='',
    this.isColored=false
  });

  final String imagePath;
  final String text;
final bool isColored;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.only(
            start: 24.w, end: 24.w, top: 16.h, bottom: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.myWhite,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Color.fromRGBO(191, 214, 215, 0.6))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           isColored? Container(
             decoration: BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(360.r)),
              width: 80.w,
              height: 80.h,
              child: Center(
                child: SvgPicture.asset( color: AppColors.myWhite,fit: BoxFit.fill,
                  imagePath,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
            ):
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: SvgPicture.asset(
                imagePath,
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 100.w,
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.apply(
                        fontSizeFactor: 1.1.sp,
                        color: AppColors.dark,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
