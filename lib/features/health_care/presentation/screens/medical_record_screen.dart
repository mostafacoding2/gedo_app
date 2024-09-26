import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/health_care_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_medical_details_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_prescriptions_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_medical_details_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_prescription_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/home_item_widget.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalRecordScreen extends StatelessWidget {
  const MedicalRecordScreen({super.key});

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicalRecordAndDetailsWidgetInTopOfScreen(
                iswhite: true,
                containerHeight: 275,
                title: AppString.medicalRecord,
                navigateToBottomNav: true,
                Screen: const HealthCareScreen(),
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
                              navigateTo(context,
                                  const LastMedicalDetailsScreen());
                            },
                            imagePath: ImagesPath.medicaldetails,
                            text: AppString.medicaldetails,
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0, -50.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeScreenItemWidget(
                            onTap: () {
                              navigateTo(
                                  context, const LastAnalysisScreen());
                            },
                            imagePath: ImagesPath.analysis,
                            text: AppString.analysis,
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -20.h),
                      child: HomeScreenItemWidget(
                        onTap: () {
                          navigateTo(
                              context, const LastPrescriptionsScreen());
                        },
                        imagePath: ImagesPath.prescription,
                        text: AppString.prescription,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
