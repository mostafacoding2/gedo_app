import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/profile/presentation/screens/user_guide_screenOne.dart';
import 'package:alzcare/features/profile/presentation/screens/user_guide_screen_three.dart';
import 'package:alzcare/features/profile/presentation/widgets/custom_buttom_next_user_guide.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:alzcare/features/profile/presentation/widgets/user_guide_body_one.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:alzcare/features/profile/presentation/widgets/user_guide_body_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuideScreenTwo extends StatelessWidget {
  const UserGuideScreenTwo({super.key});
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
          widgetnavigate: UserGuideScreenOne(),
        ),
        SizedBox(height: 36.h,),
        const Expanded(child: UserGuideBodyTwo()),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 243,top: 26.h,bottom: 18.h),
          child: CustomNextBottom(onTap: (){navigateTo(context, const UserGuideScreenThree());},),
        )
      ],),
    ));
  }
}
