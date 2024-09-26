import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlarmDrugItem extends StatelessWidget {
  const AlarmDrugItem(
      {super.key,
      required this.namedrug,
      required this.usageSchedule,
      required this.endDate,
      required this.content,
      required this.timeOfUsage,
      required this.widget});

  final String namedrug;
  final String usageSchedule;
  final String endDate;
  final String timeOfUsage;
  final String content;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 327.w,
        margin: EdgeInsets.only(bottom: 16.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8.r),
            color: AppColors.myWhite,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: Color.fromRGBO(191, 214, 215, 0.6))
            ]),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Icon(Icons.alarm, size: 30, color: AppColors.primaryColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: lightTheme.textTheme.headlineMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        namedrug,
                        style: lightTheme.textTheme.headlineMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$usageSchedule : ',
                    style: lightTheme.textTheme.headlineMedium!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 0.w,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: lightTheme.textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.dark,
                      ),
                    ),
                  ),
                ],
              ),
                  if(usageSchedule == 'اسبوعياً') SizedBox(
                    height: 5.h,
                  ),
                  if(usageSchedule == 'اسبوعياً')Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${AppString.Whentousethemedicine} :',
                        style: lightTheme.textTheme.headlineMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        timeOfUsage,
                        style: lightTheme.textTheme.headlineMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                  ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${AppString.Whentostopthemedicine} :',
                    style: lightTheme.textTheme.headlineMedium!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    endDate.split('T').first,
                    style: lightTheme.textTheme.headlineMedium!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.dark,
                    ),
                  ),
                ],
              ),

              widget,
              SizedBox(
                height: 5.h,
              ),
            ])));
  }
}
