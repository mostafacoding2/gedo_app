import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class UserGuideBodyOne extends StatelessWidget {
  const UserGuideBodyOne({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Column(children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: SvgPicture.asset(ImagesPath.appBarUserGuide,height: 158.h,width: 345.w,fit: BoxFit.fill,),
        ),
        SizedBox(height: 16.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 32.r),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                Text('لأستخدام قراءة الادوية عليك اتباع الخطوات التاليه :', style:
                Theme.of(context).textTheme.displayMedium!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('١-قم بالذهاب الى الصفحه الرئيسيه', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٣-قم بأختيار قراءة الادوية', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٤-ثم أختار ما هو مناسب لك لمعرفة تفاصيل الدواء و مدى تعارض الدواء مع الطعام و الأدوية الاخرى', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 47.h,),
                HomeScreenItemWidget(
                  onTap: () {
                  },
                  imagePath: ImagesPath.medicalRecord,
                  text: AppString.medicalRecord,
                ),

              ],),
            ),
            SizedBox(width: 15.w,),
            Expanded(
              child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                HomeScreenItemWidget(
                  onTap: () {
                  },
                  imagePath: ImagesPath.Readmedications,
                  text: AppString.readMedications,
                ),
                SizedBox(height: 47.h,),

                Text('لأستخدام السجل الطبي عليك اتباع الخطوات التاليه :', style:
                Theme.of(context).textTheme.displayMedium!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('١-قم بالذهاب الى الصفحه الرئيسيه', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٢-ثم الضغط على الرعايه الطبيه', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٣-قم بأختيار السجل الطبي', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),

                Text('٤-ثم أختار ما هو مناسب لك لأضافة تفاصيلك الطبيه و التحاليل و الرشتات', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),

              ],),
            )
          ],),
        ),
        SizedBox(height: 26.h,),

      ],),
    ));
  }
}
