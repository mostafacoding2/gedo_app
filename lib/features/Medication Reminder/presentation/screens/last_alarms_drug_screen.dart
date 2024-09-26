import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/controller/medication_reminder_cubit.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/screens/create_alarm_drug_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/custom_add_analysis_details_prescription.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/widgets/custom_alarm_drug_item.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../health_care/presentation/widgets/sure_delete_dialog.dart';

class LastAlarmDrugScreen extends StatefulWidget {
  const LastAlarmDrugScreen({
    super.key,
  });

  @override
  State<LastAlarmDrugScreen> createState() => _LastAlarmDrugScreenState();
}

class _LastAlarmDrugScreenState extends State<LastAlarmDrugScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => sl<MedicationReminderCubit>()
        ..getAllMedicationReminder(userId: userId),
      child: SafeArea(
        child: Scaffold(
            body: Column(children: [
          CustomAppBarTextAndArrowWidget(
            iswhite: false,
            title: AppString.lastalarms,
            navigateToBottomNav: true,
            widgetnavigate: BottomNavScreen(currentIndex: null),
          ),
          Expanded(
              child: Stack(children: [
            Container(
                height: 470.h,
                margin: EdgeInsets.symmetric(horizontal: 24.r, vertical: 40.r),
                child: BlocConsumer<MedicationReminderCubit,
                    MedicationReminderState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return (state is GetAllMedicationReminderLoadingState)
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : MedicationReminderCubit.get(context).data.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    SizedBox(
                                        height: 200.h,
                                        width: double.infinity,
                                        child: SvgPicture.asset(
                                          ImagesPath.drugalarmbackground,
                                          height: 200.h,
                                        )),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      userType == '3'
                                          ? AppString.notFoundAnyAlarmCareGiver
                                          : AppString.notFoundAnyAlarm,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .apply(
                                            fontSizeFactor: 1.sp,
                                            color: AppColors.dark,
                                            fontWeightDelta: 1,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ])
                            : ListView.builder(
                                itemCount: MedicationReminderCubit.get(context)
                                    .data
                                    .length,
                                itemBuilder: (context, index) {
                                  final cubit =
                                      MedicationReminderCubit.get(context)
                                          .data[index];
                                  List<String> times = [];
                                  if (cubit.usageSchedule != 'شهرياً') {
                                    List<String> formatTimes(
                                        List<String> times) {
                                      List<String> formattedTimes = [];

                                      for (var time in times) {
                                        List<String> parts = time.split(':');
                                        int hour = int.parse(parts[0]);
                                        int minute = int.parse(parts[1]);
                                        String formattedTime;

                                        if (hour >= 12) {
                                          int formattedHour =
                                              hour > 12 ? hour - 12 : hour;
                                          formattedTime =
                                              "$formattedHour:${minute.toString().padLeft(2, '0')} مساءا";
                                        } else {
                                          formattedTime =
                                              "$hour:${minute.toString().padLeft(2, '0')} صباحا";
                                        }

                                        formattedTimes.add(formattedTime);
                                      }
                                      return formattedTimes;
                                    }

                                    times = formatTimes(cubit.times!);
                                  }

                                  return AlarmDrugItem(
                                    namedrug: cubit.medicationName!,
                                    usageSchedule: cubit.usageSchedule!,
                                    timeOfUsage: times.toString(),
                                    endDate: cubit.endDate!,
                                    content: cubit.usageSchedule == 'اسبوعياً'
                                        ? '  ${cubit.daysOfWeek!}'
                                        : cubit.usageSchedule == 'يوميا'
                                            ? '  ${times}'
                                            : '  ${(cubit.times)}',
                                    widget: BlocBuilder<MedicationReminderCubit,
                                        MedicationReminderState>(
                                      builder: (context, state) {
                                        var medicationCubit = MedicationReminderCubit.get(context);
                                        if (state
                                            is DeleteMedicationReminderLoadingState) {
                                          Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ),
                                          );
                                        }
                                        if (state
                                            is DeleteMedicationReminderErrorState) {
                                          flutterToast(
                                              message: state.error,
                                              success: false);
                                        }
                                        if (state
                                            is DeleteMedicationReminderSuccessState) {
                                          flutterToast(
                                              message: AppString.Deleted,
                                              success: true);
                                          MedicationReminderCubit.get(context)
                                              .getAllMedicationReminder(
                                                  userId: userId);
                                        }
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                      barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return  DeleteItemSureDialog(
                                                          title: "هل متأكد من حذف هذا",
                                                          onPressed: ()
                                                          {
                                                          medicationCubit
                                                                .deleteMedicationReminder(
                                                                id: cubit.id!);
                                                            Navigator.pop(context);
                                                          },
                                                        );});

                                                },
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Color(0xffA4AAAB),
                                                  size: 32,
                                                )),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                });
                  },
                )),
            CustomAddAnalysisdetailsPrescription(
              onTap: () {
                navigateTo(context, CreateAlarmDrugScreen());
              },
            ),
            const CustomBottomCurvyCircles(),
          ]))
        ])),
      ),
    );
  }
}
