import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:alzcare/features/home_data/presentation/screens/camera_diagnosis_white_water_diseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/listview_result_white_waterdiseases_screen.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/services.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ResultDiagnosisWhiteWaterScreen extends StatelessWidget {
  const ResultDiagnosisWhiteWaterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: AppColors.myWhite,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    );
    return    SafeArea(
      child: Scaffold(
      body: Column(children: [
      const CustomAppBarTextAndArrowWidget(
      iswhite: false,
      title: AppString.result,
      navigateToBottomNav: true,
      widgetnavigate:CameraDiagnosisWhiteWaterDiseasesScreen(),
    ),
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 24.r),
                child: Column(
                    children: [
                      Container(
                        width: 327.w,height: 250.h,
                        margin: EdgeInsetsDirectional.only(top:48.r),
                        decoration: const BoxDecoration(borderRadius: BorderRadiusDirectional.all(Radius.circular(16))),
                        child: SvgPicture.asset(ImagesPath.dataalanysis),)

                      ,SizedBox(height: 24.h,)

                      , Text(' مصاب بالماء البيضة',style: Theme.of(context).textTheme.displayLarge!.apply(
                        fontSizeFactor: 1.1.sp,
                        color: AppColors.primaryColor,
                      )),
                      SizedBox(height: 16.h,),

                      Container(width: 301,height: 2,color: const Color.fromRGBO(235, 237, 237, 1),),
                      SizedBox(height: 12.h,),

                      Row(
                        children: [
                          Icon(Icons.circle,color: AppColors.lightprimaryColor,size: 16.r,),
SizedBox(width: 4.w,),
                          Text("""نوصى بمراجعة الطبيب في اقرب وقت ممكن 
إذا كان المرض يتقدم """,style: Theme.of(context).textTheme.displayMedium!.apply(
                            fontSizeFactor: 1.1.sp,
                            color: AppColors.dark,
                          ),textAlign: TextAlign.center,),
                        ],
                      ),


                    ]

                ),),       PositionedDirectional(
                top: 462.h,start: 24.r,end: 24.r,
                  child: CustomButton(
                  containerColor: AppColors.primaryColor,
                  text: "save",
                  onPressed: () {
                    navigateTo(context,  const ListviewResultWhiteWaterScreen());
                  },
                                ),
                ),

              const CustomBottomCurvyCircles()
            ],
          ),
        )
    ],)));
  }
}
