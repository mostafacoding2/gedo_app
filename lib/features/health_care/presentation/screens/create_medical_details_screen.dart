import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/health_care/presentation/controller/medical_details_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_medical_details_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/medical_record_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_details_body.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CreateMedicalDetailsScreen extends StatelessWidget
{
   CreateMedicalDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return  SafeArea(
        child:        BlocProvider(
        create: (context) => sl<MedicalDetailsCubit>(),  child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
            children:
            [
                MedicalRecordAndDetailsWidgetInTopOfScreen(
                  iswhite: true,
                  containerHeight: 203.h,title: AppString.medicaldetails,navigateToBottomNav: true,Screen: const LastMedicalDetailsScreen(),
                ),
             const MedicalDetailsBody()
            ],
            ),
          ),),
));
  }
}