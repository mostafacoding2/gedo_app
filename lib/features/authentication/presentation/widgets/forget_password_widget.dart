import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';

import 'package:alzcare/core/utils/images_paths.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        SvgPicture.asset(
          ImagesPath.resetPassword,
          width: 200.w,
          height: 185.h,
        ),
        SizedBox(
          height: 49.h,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.myWhite,
              border: Border.all(
                color: AppColors.myGrey,
              ),
              borderRadius: BorderRadius.circular(16.r)),
          padding:
          EdgeInsets.symmetric(vertical: 21.h, horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImagesPath.exclamationMarkIcon,
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "We will send the OTP code to your email for security"
                        .tr(context),

                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .apply(
                      fontSizeFactor: 1.1.sp,color: AppColors.primaryColor
                    ),
                  ),
                ],
              ),
              Text(
                "When you forget your password".tr(context),
                style:
                Theme.of(context).textTheme.headlineMedium!.apply(
                  fontSizeFactor: 1.1.sp,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
