import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/home_data/presentation/screens/camera_diagnosis_white_water_diseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/result_diagnosis_white_water_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/Item_whitewater_diseases.dart';
import 'package:alzcare/features/health_care/presentation/widgets/custom_add_analysis_details_prescription.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/services.dart';
class ListviewResultWhiteWaterScreen extends StatelessWidget {
  const ListviewResultWhiteWaterScreen({super.key});
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
      child: Scaffold(body:
      Column(children: [
        const CustomAppBarTextAndArrowWidget(
          iswhite: false,
          title: AppString.result,
          navigateToBottomNav: true,
          widgetnavigate: ResultDiagnosisWhiteWaterScreen(),
        ),
        Expanded(
            child: Stack(
                children: [
                  Container(
                      height:470.h,
                      margin:  EdgeInsets.symmetric(
                          horizontal: 24.r, vertical: 40.r),
                      child: ListView.builder(
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return const ItemWhiteWaterDiseases(); }
                      )),
                  CustomAddAnalysisdetailsPrescription(onTap: (){navigateAndRemove(context,const CameraDiagnosisWhiteWaterDiseasesScreen());},),
                const  CustomBottomCurvyCircles(),

                ]))
      ])
      ),);
  }
}
