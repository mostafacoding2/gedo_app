import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserGuideBodyTwo extends StatelessWidget {
  const UserGuideBodyTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Column(children: [
        SizedBox(height: 16.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 32.r),
          child: Row(children: [
            Expanded(
              child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                Text('لأستخدام قراءة الاشياء عليك اتباع الخطوات التاليه :', style:
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
                Text('٢-ثم الضغط على القراءة الصوتيه', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٣-قم بتصوير الشئ المراد قراءته أو أختيار صورة من معرض الصور', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٤-ثم الضغط على مكبر الصوت لقراءة ما هو مكتوب في الصورة', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 47.h,),

                HomeScreenItemWidget(
                  onTap: () {
                  },
                  imagePath: ImagesPath.drugAlarm,
                  text: AppString.drugAlarm,
                ),

SizedBox(height: 47.h,),

                Text('لأستخدام التشخيص على المياء البيضاء عليك اتباع الخطوات التاليه :', style:
                Theme.of(context).textTheme.displayMedium!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),

                Text('١-قم بالذهاب الى الصفحه الرئيسيه',textAlign: TextAlign.start, style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٢-ثم الضغط على الأمراض', textAlign: TextAlign.start,style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),
                Text('٣-قم بأختيار المياء البيضاء ', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                  SizedBox(height: 8.h,),
                  Text('٤-ثم قم بتوجيه الكاميرا جيداً نحو العين لمعرفة أذا كنت مصاب أم لا', style:
                  Theme.of(context).textTheme.headlineLarge!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.dark,
                  ),),


              ],),
            ),

            SizedBox(width: 15.w,),
            Expanded(
              child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                HomeScreenItemWidget(
                  onTap: () {
                  },
                  imagePath: ImagesPath.viewContent,
                  text: AppString.audioReading,
                ),
                SizedBox(height: 47.h,),
                Text('لأستخدام ضبط منبه الدواء عليك اتباع الخطوات التاليه :', style:
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
                Text('٢-ثم الضغط على منبه الدواء', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 8.h,),

                Text('٣-قم بأضافة منبه جديد', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                  SizedBox(height: 8.h,),

                  Text('٤-ثم اضافة أسم الدواء و موعد أستعماله و موعد توقفه', style:
                Theme.of(context).textTheme.headlineLarge!.apply(
                  fontSizeFactor: 1.1.sp,
                  color: AppColors.dark,
                ),),
                SizedBox(height: 47.h,),
                HomeScreenItemWidget(
                  onTap: () {
                  },
                  imagePath: ImagesPath.Whitewater,
                  text: AppString.Whitewater,
                ),
              ],),
            )
          ],),
        ),

      ],),
    ));
  }
}
