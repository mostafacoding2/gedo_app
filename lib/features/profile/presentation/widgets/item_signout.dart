import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/shared%20_pref.dart';
import 'package:alzcare/features/authentication/presentation/screens/select_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemSigOut extends StatelessWidget {
  const ItemSigOut({super.key, required this.title});

  final String title;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
        backgroundColor: AppColors.myWhite,
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          height: 250.h,
          width: 327.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppString.warning,
                style: lightTheme.textTheme.labelMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Text(
                title,
                style: lightTheme.textTheme.displaySmall!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.dark,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      PreferenceUtils.removeData(SharedKeys.token);
                      PreferenceUtils.removeData(SharedKeys.userId);
                      PreferenceUtils.removeData(SharedKeys.userName);
                      PreferenceUtils.removeData(SharedKeys.profileImage);
                      navigateTo(context, const SelectTypeUserScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                          color: AppColors.myRedLight,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Text(AppString.sure,
                            style: lightTheme.textTheme.labelMedium!.apply(
                              fontSizeFactor: 1.sp,
                              color: AppColors.myWhite,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                          color: AppColors.myGrey,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                          child: Text(AppString.cancel,
                              style: lightTheme.textTheme.labelMedium!.apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.myWhite,
                              ))),
                    ),
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
            ],
          ),
        ));
  }
}
