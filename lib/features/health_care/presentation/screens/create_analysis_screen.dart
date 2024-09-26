import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/health_care/presentation/controller/test_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/analysis_body.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/services_locator.dart';
class CreateAnalysisScreen extends StatefulWidget {
  const CreateAnalysisScreen({super.key});
  @override
  State<CreateAnalysisScreen> createState() => _CreateAnalysisScreenState();
}
class _CreateAnalysisScreenState extends State<CreateAnalysisScreen> {
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
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children:
              [
                MedicalRecordAndDetailsWidgetInTopOfScreen(
                  iswhite: true,
                  containerHeight: 203.h,title: AppString.analysis,navigateToBottomNav: true,Screen:const LastAnalysisScreen(),
                ),
                BlocProvider(
                  create: (context) => sl<TestCubit>(),
  child: const AnalysisBodyScreen(),
)
              ],
            ),
          ),));
  }
}


