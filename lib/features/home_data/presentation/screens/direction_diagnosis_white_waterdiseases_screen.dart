import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/home_data/presentation/screens/camera_diagnosis_white_water_diseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/diagnosis_white_water_diseases_screen.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DirectionDiagnosisWhiteWaterDiseasesScreen extends StatelessWidget {
  const DirectionDiagnosisWhiteWaterDiseasesScreen({super.key});
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
        child: Scaffold(body: Column(
          children: [
            const CustomAppBarTextAndArrowWidget(
              iswhite: false,
              title: AppString.instructions,
              navigateToBottomNav: true,
              widgetnavigate:DiagnosisDiseasesWhitewaterScreen(),
            ),
            SizedBox(height: 58.h,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.r),
                child:Column(
                  children: [
                    Text('الرجاء استخدام الكاميرا الخلفية بدلاً من الامايمة',style: Theme.of(context).textTheme.headlineSmall!.apply(
                      fontSizeFactor: 1.1.sp,
                      color: AppColors.dark,
                    ),),
                    SizedBox(height: 44.h,),
                    Container(
                        margin: EdgeInsetsDirectional.only(start: 93.r,end: 92.r),
                        width:140.h,height:230.h,child: SvgPicture.asset(ImagesPath.DirectionDiagnosis))
                    ,  SizedBox(height: 58.h,),
                    Text('بعض التعليمات التي تساعدك لألتقاط صوره جيدة:',style: Theme.of(context).textTheme.headlineMedium!.apply(
                      fontSizeFactor: 1.1.sp,
                      color: AppColors.dark,
                    ),),
                    SizedBox(height: 16.h,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(Icons.circle,color: AppColors.lightprimaryColor,size: 16.r,),
                            SizedBox(width: 2.w,),
                            Text('أستخدام الكاميرا الخلفية بأداء جيدة',style: Theme.of(context).textTheme.headlineLarge!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.dark,
                            ),),
                          ],),
                          SizedBox(height: 11.h,),
                          Row(children: [
                            Icon(Icons.circle,color: AppColors.lightprimaryColor,size: 16.r,),
                            SizedBox(width: 1.w,),
                            Text('لا تلتقط الصورة بالداخل ليلاً',style: Theme.of(context).textTheme.headlineLarge!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.dark,
                            ),),
                          ],),
                          SizedBox(height: 11.h,),
                          Row(children: [
                            Icon(Icons.circle,color: AppColors.lightprimaryColor,size: 16.r,),
                            SizedBox(width: 2.w,),
                            Text('يرجى إلتقاط الصورة في مكان مشرق نهاراً',style: Theme.of(context).textTheme.headlineLarge!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.dark,
                            ),),
                          ],),
                          SizedBox(height: 11.h,),
                          Row(children: [
                            Icon(Icons.circle,color: AppColors.lightprimaryColor,size: 16.r,),
                            SizedBox(width: 2.w,),
                            Text('اذا كانت الصوره الملتقطه غير واضحه اعد التقاطها مره اخرىً',style: Theme.of(context).textTheme.headlineLarge!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.dark,
                            ),),
                          ],),
                          SizedBox(height: 11.h,),
                          Row(children: [
                            Icon(Icons.circle,color: AppColors.lightprimaryColor,size: 16.r,),
                            SizedBox(width: 2.w,),
                            Text('كن حريصاً على عدم أهتزاز الهاتف عند إلتقاط الصورة',style: Theme.of(context).textTheme.headlineLarge!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.dark,
                            ),),
                          ],),
                          SizedBox(height: 38.h,),
                          CustomButton(
                            text: "next",
                            onPressed: ()
                            {
                           navigateTo(context, const CameraDiagnosisWhiteWaterDiseasesScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            )
          ],)
        ));
  }
}
