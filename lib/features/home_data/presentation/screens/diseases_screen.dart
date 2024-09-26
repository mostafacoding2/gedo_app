import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/home_data/presentation/screens/diagnosis_skin_diseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/diagnosis_white_water_diseases_screen.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/home_item_widget.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiseasesScreen extends StatelessWidget {
  const DiseasesScreen({super.key});

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
            Container(
              height: 386.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(16.r),
                      bottomEnd: Radius.circular(16.r))),
              child: CustomAppBarTextAndArrowWidget(
                iswhite: true,
                title: AppString.diseases,
                navigateToBottomNav: true,
                widgetnavigate: BottomNavScreen(
                  currentIndex: null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Transform.translate(
                        offset: Offset(0, -80.h),
                        child: HomeScreenItemWidget(
                          onTap: () {
                            navigateTo(context, const DiagnosisDiseasesSkinDesiesScreen(modelName: AppString.Whitewater,));
                          },
                          imagePath: ImagesPath.Whitewater,
                          text: AppString.Whitewater,
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(0, -30.h),
                    child: HomeScreenItemWidget(
                      onTap: () {
                        navigateTo(
                            context, const DiagnosisDiseasesSkinDesiesScreen(modelName: AppString.skindesies,));
                      },
                      imagePath: ImagesPath.skindesies,
                      text: AppString.skindesies,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
