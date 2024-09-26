import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/home_data/presentation/screens/reading_medications_withcamera_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:alzcare/features/home_data/presentation/widgets/medication_result_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MedicationResultScreen extends StatelessWidget {
  const MedicationResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: AppColors.myWhite,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    );
    return   const SafeArea(
    child: Scaffold(
      body: Column(children: [
        CustomAppBarTextAndArrowWidget(
        iswhite: false,
        title: AppString.medicationresult,
        navigateToBottomNav: true,
        widgetnavigate:ReadingMedicationsWithcameraScreen(),
      ),
        MedicationResultBody()
      ],),


    ));
  }
}
