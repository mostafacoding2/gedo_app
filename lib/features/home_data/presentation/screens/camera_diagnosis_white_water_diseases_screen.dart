import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/screens/direction_diagnosis_white_waterdiseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/result_diagnosis_white_water_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CameraDiagnosisWhiteWaterDiseasesScreen extends StatelessWidget {
  const CameraDiagnosisWhiteWaterDiseasesScreen({super.key});
  @override
  Widget build(BuildContext context) {
  return  SafeArea(
    child: Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(width: 375.w,height: 475.h,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(178, 209, 209, 1),
                  borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(16.r),
                      bottomStart:Radius.circular(16)
                  )),),
            PositionedDirectional(top:32.r, end:32.r,start:319.w,child: Container(
              child: IconButton(icon: Icon(size:32,Icons.cancel,color: AppColors.primaryColor,),onPressed: (){
                navigateTo(context, DirectionDiagnosisWhiteWaterDiseasesScreen());
              },),))
    
          ],
        ),
        Row(children: [
          GestureDetector(onTap:(){},child: Padding( padding:EdgeInsetsDirectional.only(top:127.r,start: 55.r),child: SvgPicture.asset(width:35.w,height:35.h,ImagesPath.Return),)),
          GestureDetector(onTap: (){ navigateAndRemove(context, ResultDiagnosisWhiteWaterScreen());},child: Padding(padding:EdgeInsetsDirectional.only(top:97.r,start: 50.r),child: SvgPicture.asset(width:95.w,height:95.h,ImagesPath.diagnosis),)),
          GestureDetector( onTap:(){},child: Padding(padding:EdgeInsetsDirectional.only(top:127.r,start: 50.r),child: SvgPicture.asset(width:35.h,height:35.h,ImagesPath.addimage),)),
        ],)
      ],),
    ),
  );
  }
}