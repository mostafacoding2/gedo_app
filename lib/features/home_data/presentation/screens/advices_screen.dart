import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvicesScreen extends StatelessWidget {
  const AdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBarTextAndArrowWidget(
              iswhite: false,
              title: AppString.advice,
              navigateToBottomNav: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Stack(
                children: [
                  Container(
                      margin:
                          EdgeInsetsDirectional.only(top: 500.h, end: 185.w),
                      height: 225.h,
                      width: 224.5.w,
                      child: SvgPicture.asset(ImagesPath.backgroundadvice)),
                  Column(
                    children: [
                      SizedBox(
                        height: 74.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: SvgPicture.asset(ImagesPath.advice, width: 24.w,
                                height: 24.h,)),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'الرعاية الصحية',
                            style:
                                Theme.of(context).textTheme.displaySmall!.apply(
                                      fontSizeFactor: 1.1.sp,
                                      color: AppColors.dark,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              'زيارات منتظمة للطبيب وفحوصات دورية للكشف عن أي مشاكل صحية',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                    fontSizeFactor: 1.1.sp,
                                    color: AppColors.dark,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              'توفير الأدوية اللازمة وضمان التوعية بالجرعات والآثار الجانبية',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                    fontSizeFactor: 1.1.sp,
                                    color: AppColors.dark,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              'خدمات العلاج الطبيعي للمساعدة في تحسين حركة المفاصل واللياقة البدنية',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                    fontSizeFactor: 1.1.sp,
                                    color: AppColors.dark,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: SvgPicture.asset(ImagesPath.advice , width: 24.w,
                                height: 24.h,)),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'الدعم النفسي والاجتماعي',
                            style:
                                Theme.of(context).textTheme.displaySmall!.apply(
                                      fontSizeFactor: 1.1.sp,
                                      color: AppColors.dark,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              'جلسات استشارية نفسية للتعامل مع التحديات النفسية والعاطفية',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                fontSizeFactor: 1.1.sp,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              'تنظيم فعاليات اجتماعية ومجموعات دعم لتعزيز التواصل والتفاعل الاجتماعي',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                fontSizeFactor: 1.1.sp,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              'برامج لتعزيز الصحة النفسية والعقلية، مثل الأنشطة الإبداعية وورش العمل',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                fontSizeFactor: 1.1.sp,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: SvgPicture.asset(ImagesPath.advice ,  width: 24.w,
                                height: 24.h,)),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'برامج التثقيف الصحي',
                            style:
                                Theme.of(context).textTheme.displaySmall!.apply(
                                      fontSizeFactor: 1.1.sp,
                                      color: AppColors.dark,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                           SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                            'ورش عمل تثقيفية حول الحياة الصحية وكيفية العناية بالنفس',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                    fontSizeFactor: 1.1.sp,
                                    color: AppColors.dark,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.lightprimaryColor,
                            size: 16.r,
                          ),
                           SizedBox(
                            width: 5.w
                            ,
                          ),
                          Expanded(
                            child: Text(
                              'تشجيع على نمط حياة صحي، بما في ذلك النظام الغذائي الصحي والنشاط البدني المناسب',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                fontSizeFactor: 1.1.sp,
                                color: AppColors.dark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
