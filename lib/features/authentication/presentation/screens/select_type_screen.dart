import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/screens/login_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SelectTypeUserScreen extends StatelessWidget {
  const SelectTypeUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
              height: 46.h,
            ),
            SvgPicture.asset(
              ImagesPath.selectUserType,
              width: 200.w,
              height: 200.w,
            ),
            SizedBox(
              height: 93.h,
            ),
            CustomButton(
              text: "user",
              onPressed: ()
              {
                //navigateTo(context,  BottomNavScreen(currentIndex: null,));
               navigateTo(context, const LoginScreen(isPatient: true,));
              },
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
          text: "careGiver",
          onPressed: ()
          {
            navigateTo(context, const LoginScreen(isPatient: false,));
          },
          colorIsWhite: true,
        ),

          ],
        ),
      ),
    );
  }
}

