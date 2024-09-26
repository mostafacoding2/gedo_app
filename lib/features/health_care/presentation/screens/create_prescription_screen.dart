import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/health_care/presentation/controller/prescription_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_prescriptions_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:alzcare/features/health_care/presentation/widgets/prescription_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CreatePrescriptionScreen extends StatelessWidget {
  const CreatePrescriptionScreen({super.key});

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
                  children:
                  [
                    MedicalRecordAndDetailsWidgetInTopOfScreen(
                      iswhite: true,
                      containerHeight: 203.h,
                      title: AppString.prescription,
                      navigateToBottomNav: true,
                      Screen: const LastPrescriptionsScreen(),
                    ),
                BlocProvider(
                  create: (context) => sl<PrescriptionCubit>(),child: const PrescriptionBodyScreen())
                  ],
                ))));
  }
}
