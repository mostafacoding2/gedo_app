import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserGuideBodyThree extends StatelessWidget {
  const UserGuideBodyThree({super.key});
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
                    },isColored: true,
                    imagePath: ImagesPath.communityNav,
                  ),



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
                    imagePath: ImagesPath.skindesies,
                    text: AppString.skindesies,
                  ),
                  SizedBox(height: 47.h,),
                  Text('لأستخدام التواصل الاجتماعي عليك اتباع الخطوات التاليه :', style:
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
                  Text('٢-ثم الضغط هذه الايقونه ', style:
                  Theme.of(context).textTheme.headlineLarge!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.dark,
                  ),),
                  SizedBox(height: 8.h,),

                  Text('٣-قم بنشر ما تريده من خلال بم تفكر', style:
                  Theme.of(context).textTheme.headlineLarge!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.dark,
                  ),),
                  SizedBox(height: 8.h,),

                  Text('٤-ثم الضغط على ايقونة الدردشه لتحدث مع المرافق لديك', style:
                  Theme.of(context).textTheme.headlineLarge!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.dark,
                  ),),

                ],),
            )
          ],),
        ),

      ],),
    ));
  }
}
