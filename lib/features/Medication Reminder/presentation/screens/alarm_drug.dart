import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/screens/create_alarm_drug_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_color.dart';
class AlarmDrugScreen extends StatelessWidget {
  const AlarmDrugScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(
      child: Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      MedicalRecordAndDetailsWidgetInTopOfScreen(iswhite: true,
      containerHeight: 203,
      title: AppString.drugAlarm,
      navigateToBottomNav: true,
      Screen:BottomNavScreen(currentIndex: null,),),
      Padding(
        padding:EdgeInsetsDirectional.only(top:103.r,start: 83.r),
        child: SizedBox(
            width: 200.w,
            height: 200.h,
            child: SvgPicture.asset(ImagesPath.drugalarmbackground)),
      ),
        SizedBox(height: 84.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0.r),
          child: CustomButton(
            text: "addalarm",
            onPressed: ()
            {
             navigateTo(context,  CreateAlarmDrugScreen());
            },
          ),
        ),
      ])));
  }
}