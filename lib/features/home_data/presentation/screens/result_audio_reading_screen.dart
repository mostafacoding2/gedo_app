import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/home_data/presentation/screens/camera.audioreading_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ResultAudioReadingScreen extends StatelessWidget {
  const ResultAudioReadingScreen({super.key});
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
            CustomAppBarTextAndArrowWidget(
              iswhite: false,
              title: AppString.result,
              navigateToBottomNav: true,
              widgetnavigate:CameraAudioReadingScreen(),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 24.r),
                    child: Column(
                        children: [
                          Container(
                            width: 327.w,height: 300.h,
                            margin: EdgeInsetsDirectional.only(top:56.r),
                            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.all(Radius.circular(16))),
                            child: SvgPicture.asset(ImagesPath.dataalanysis),)

                          ,SizedBox(height: 24.h,)



                        ]

                    ),),       GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin:
                      EdgeInsetsDirectional.only(top: 457.r, start: 295.r,bottom: 25.r),
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadiusDirectional.circular(360),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0,4),
                                blurRadius: 4,
                                spreadRadius: 0,
                                color: Color.fromRGBO(225, 225, 225, 1))
                          ]),
                      child: Icon(
                        Icons.volume_down_sharp,
                        color: AppColors.myWhite,
                        size: 30,
                      ),
                    ),
                  ),

                  CustomBottomCurvyCircles()
                ],
              ),
            )
          ],),


        ));
  }
}