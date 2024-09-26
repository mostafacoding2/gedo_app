import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/screens/home_screen.dart';
import 'package:alzcare/features/authentication/presentation/screens/login_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AfterResetPasswordScreen extends StatelessWidget {
  const AfterResetPasswordScreen({super.key, required this.isPatient});

  final bool isPatient;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 102.r),
                SvgPicture.asset(
                  ImagesPath.youcanenter,
                  height: 230.h,
                  width: 190.w,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [

                    Container(
                      height: 400.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(94.r))),
                    ),
                    PositionedDirectional(
                      top: -120.h,
                      start: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          border: BorderDirectional(
                            top: BorderSide(
                              color: AppColors.myWhite,
                              width: 0,
                            ),
                            bottom: BorderSide(
                              color: AppColors.primaryColor,
                              width: 0,
                            ),
                            start: BorderSide(
                              color: AppColors.myWhite,
                              width: 0,
                            ),
                            end: BorderSide(
                              color: AppColors.myWhite,
                              width: 0,
                            ),
                          ),
                        ),
                        child: Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: AppColors.myWhite,
                            border: Border.all(

                              width: 0,
                              strokeAlign: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius:
                            BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(150.r),
                            ),
                          ),
                        ),
                      ),
                    ),

                    PositionedDirectional(
                      top: 160.h,
                      start: 24.w,
                      end: 24.w,
                      child: CustomButton(
                        colorIsWhite: true,
                        text: "startNow",
                        height: 48.h,
                        onPressed: () {
                          navigateAndRemove(
                              context, LoginScreen(isPatient: isPatient));
                        },
                      ),
                    ),
                     PositionedDirectional(
                        top: 80.h,
                        start: 24.w,
                        end: 24.w,
                        child: Text(
                          "resetPasswordDone".tr(context),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge!.apply(
                            fontSizeFactor: 1.1.sp,
                            color: AppColors.myWhite,
                          ),
                        )),


                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
