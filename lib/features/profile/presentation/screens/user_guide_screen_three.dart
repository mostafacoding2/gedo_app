import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/profile/presentation/screens/user_guide_screen_two.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:alzcare/features/profile/presentation/widgets/user_guide_body_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserGuideScreenThree extends StatelessWidget {
  const UserGuideScreenThree({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return  SafeArea(child: Scaffold(
      body: Column(children: [
        const CustomAppBarTextAndArrowWidget(
          iswhite: false,
          title: AppString.userGuide,
          navigateToBottomNav: true,
          widgetnavigate: UserGuideScreenTwo(),
        ),
        SizedBox(height: 36.h,),
        const Expanded(child: UserGuideBodyThree()),

      ],),
    ));
  }
}
