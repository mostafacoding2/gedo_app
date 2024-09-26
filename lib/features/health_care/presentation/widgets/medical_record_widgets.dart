import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalRecordAndDetailsWidgetInTopOfScreen extends StatelessWidget {
  MedicalRecordAndDetailsWidgetInTopOfScreen(
      {super.key,
      required this.containerHeight,
      required this.title,
      required this.iswhite,
      this.navigateToBottomNav = false,
      this.Screen});

  final double containerHeight;
  final String title;
  final bool iswhite;
  final bool? navigateToBottomNav;
  final Widget? Screen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: containerHeight.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(64.r),
            ),
          ),
          child: CustomAppBarTextAndArrowWidget(
            title: title,
            iswhite: iswhite,
            navigateToBottomNav: navigateToBottomNav,
            widgetnavigate: Screen,
          ),
        ),
        PositionedDirectional(
          bottom: -60.h,
          start: 0.w,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: BorderDirectional(
                bottom: BorderSide(
                  color: AppColors.myWhite,
                  width: 0,
                ),
                end: BorderSide(
                  color: AppColors.myWhite,
                  width: 0,
                ),
                top: BorderSide(
                  color: AppColors.primaryColor,
                  width: 0,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.myWhite,
                border: Border.all(
                    color: AppColors.myWhite,
                    style: BorderStyle.none,
                    width: 0),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(150.r),
                ),
              ),
              height: 60.h,
              width: 80.w,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBarTextAndArrowWidget extends StatelessWidget {
  const CustomAppBarTextAndArrowWidget(
      {super.key,
      required this.title,
      this.navigateToBottomNav = false,
      required this.iswhite,
      this.widgetnavigate});

  final String title;
  final bool? navigateToBottomNav;
  final bool iswhite;
  final Widget? widgetnavigate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: iswhite
                    ? lightTheme.textTheme.displayLarge!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myWhite,
                      )
                    : lightTheme.textTheme.labelLarge!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.dark,
                      ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 4.0.h),
                child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: IconButton(
                        onPressed: () {
                          if (navigateToBottomNav == true) {
                            navigateAndRemove(context, widgetnavigate);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.r,
                          color: iswhite ? AppColors.myWhite : AppColors.dark,
                        ))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
