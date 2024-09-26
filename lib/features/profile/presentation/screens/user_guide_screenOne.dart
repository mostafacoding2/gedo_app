import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/profile/presentation/screens/user_guide_screen_two.dart';
import 'package:alzcare/features/profile/presentation/widgets/custom_buttom_next_user_guide.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:alzcare/features/profile/presentation/widgets/user_guide_body_one.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:alzcare/features/profile/presentation/widgets/user_guide_body_three.dart';
import 'package:alzcare/features/profile/presentation/widgets/user_guide_body_two.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuideScreenOne extends StatelessWidget {
  const UserGuideScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

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
          CustomAppBarTextAndArrowWidget(
            iswhite: false,
            title: AppString.userGuide,
            navigateToBottomNav: true,
            widgetnavigate: BottomNavScreen(
              currentIndex: 3,
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, index)
              {

                if(index == 0) {
                  return const UserGuideBodyOne();
                }
                if(index == 1) {
                  return const UserGuideBodyTwo();
                }
                if(index == 2) {
                  return const UserGuideBodyThree();
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 243.w, bottom: 10.h),
            child: CustomNextBottom(
              onTap: () {
               pageController.nextPage(duration: const Duration(microseconds: 1000), curve: Curves.easeIn);
              },
            ),
          )
        ],
      ),
    ));
  }
}
