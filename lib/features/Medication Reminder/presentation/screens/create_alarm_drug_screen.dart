import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/controller/medication_reminder_cubit.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/screens/last_alarms_drug_screen.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/widgets/create_alarm_drug_body.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAlarmDrugScreen extends StatelessWidget {
  CreateAlarmDrugScreen({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                MedicalRecordAndDetailsWidgetInTopOfScreen(
                  iswhite: true,
                  containerHeight: 203,
                  title: AppString.drugAlarm,
                  navigateToBottomNav: false,
                  Screen: const LastAlarmDrugScreen(),
                ),
                BlocProvider(
                  create: (context) => sl<MedicationReminderCubit>(),
                  child: const CreateAlarmDrugBody(),
                )

              ]),
            )));
  }
}

