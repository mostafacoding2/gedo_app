import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/controller/medication_reminder_cubit.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/screens/last_alarms_drug_screen.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/widgets/container_day.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CreateAlarmDrugBody extends StatefulWidget {
  const CreateAlarmDrugBody({super.key});

  @override
  State<CreateAlarmDrugBody> createState() => _CreateAlarmDrugBodyState();
}

class _CreateAlarmDrugBodyState extends State<CreateAlarmDrugBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usageSchedulecontroller = TextEditingController();
  final TextEditingController drugnamecontroller = TextEditingController();
  final TextEditingController enddatecontroller = TextEditingController();
  final TextEditingController time1controller = TextEditingController();
  final TextEditingController time2controller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();

  @override
  void dispose() {
    datecontroller.dispose();
    time2controller.dispose();
    time1controller.dispose();
    usageSchedulecontroller.dispose();
    enddatecontroller.dispose();
    drugnamecontroller.dispose();
    super.dispose();
  }

  Color color = const Color.fromRGBO(95, 159, 160, 0.5);
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsetsDirectional.only(top: 393.r, end: 150.r),
            height: 242.h,
            width: 242.w,
            child: SvgPicture.asset(ImagesPath.backgroundalarm)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 39.h,
                ),
                //Todo medicationName
                CustomTextFormField(
                    controller: drugnamecontroller,
                    label: AppString.drugname,
                    obscureText: false,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return AppString.thisFieldCannotBeEmpty;
                      }
                    },
                    type: TextInputType.text),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                  controller: usageSchedulecontroller,
                  readOnly: true,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return AppString.thisFieldCannotBeEmpty;
                    }
                  },
                  label: AppString.Whentousethemedicine,
                  obscureText: false,
                  onTap: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(0, 200.h, double.infinity, 0),
                      items: options.map((String option) {
                        return PopupMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      elevation: 8,
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          usageSchedulecontroller.text = value;
                        });
                      }
                    });
                  },
                  type: TextInputType.text,
                  customSuffix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton<String>(

                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30.r,
                      ),
                      itemBuilder: (BuildContext context) {
                        return options
                            .where((element) => element != selectedOption)
                            .map((String option) {
                          return PopupMenuItem<String>(
                            value: option,
                            child: Center(
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200),
                                )),
                          );
                        }).toList();
                      },
                      onSelected: (String option) {
                        setState(() {
                          selectedOption = option;
                          usageSchedulecontroller.text = option;
                        });
                      },
                    ),
                  ),
                ),
                if (usageSchedulecontroller.text == 'يوميا')
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 26.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'الجرعات',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall!
                                  .apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.dark,
                              ),
                            ),
                            SizedBox(width: 20.w,),
                            buildNumberOfFieldsDropdown(),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        ...buildTimeFields(selectedFieldCount, true),
                      ],
                    ),
                  ),
                if (usageSchedulecontroller.text == 'اسبوعياً')
                  Column(
                    children: [
                      Container(
                        width: 340.w,
                        height: 100.h,
                        margin: EdgeInsetsDirectional.only(top: 8.r),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGrey),
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                EdgeInsetsDirectional.only(start: 16.r , bottom: 8.h , top: 8.h),
                                decoration:  BoxDecoration(
                                    color: const Color.fromRGBO(0, 100, 102, 0.7),
                                    borderRadius: BorderRadiusDirectional.only(
                                        topStart: Radius.circular(12.r),
                                        topEnd: Radius.circular(12.r))),
                                width: 340.w,
                                child: const Text(
                                  'أيام الأسبوع',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                            SizedBox(
                              height: 16.h,
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsetsDirectional.only(start: 12.w),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: daysOfWeek.length,
                                  itemBuilder: (context, index) {
                                    final day = daysOfWeek[index];
                                    final isSelected =
                                    selectedDays.contains(day);
                                    return Column(
                                      children: [
                                        containerday(
                                            text: day,
                                            onTap: () {
                                              setState(() {
                                                if (isSelected) {
                                                  selectedDays.remove(day);
                                                } else {
                                                  selectedDays.add(day);
                                                }
                                              });
                                            },
                                            colorday: isSelected
                                                ? color
                                                : AppColors.myWhite),
                                      ],
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                          ],
                        ),
                      ),SizedBox(
                        height: 16.h,
                      ),
                      ...buildTimeFields(selectedFieldCount , false),
                    ],
                  ),
                if (usageSchedulecontroller.text == 'شهرياً')
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 16.r),
                    child: CustomTextFormField(
                        readOnly: true,
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            initialDate: DateTime.now(),
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null) {
                            setState(() {
                              datecontroller.text =
                                  DateFormat('yyyy-MM-dd').format(picked);
                            });
                          }
                        },
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return AppString.thisFieldCannotBeEmpty;
                          }
                        },
                        controller: datecontroller,
                        customSuffix: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                  initialDate: DateTime.now(),
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2101),
                                );
                                if (picked != null) {
                                  setState(() {
                                    datecontroller.text =
                                        DateFormat('yyyy-MM-dd').format(picked);
                                  });
                                }
                              },
                              child: SvgPicture.asset(
                                width: 24.w,
                                height: 24.h,
                                ImagesPath.CalendarBlank,
                              ),
                            )),

                        label: AppString.date,
                        obscureText: false,
                        type: TextInputType.text),
                  ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                    readOnly: true,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        initialDate: DateTime.now(),
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          enddatecontroller.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return AppString.thisFieldCannotBeEmpty;
                      }
                    },
                    controller: enddatecontroller,
                    customSuffix: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              initialDate: DateTime.now(),
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (picked != null) {
                              setState(() {
                                enddatecontroller.text =
                                    DateFormat('yyyy-MM-dd').format(picked);
                              });
                            }
                          },
                          child: SvgPicture.asset(
                            width: 24.w,
                            height: 24.h,
                            ImagesPath.CalendarBlank,
                          ),
                        )),
                    label: AppString.Whentostopthemedicine,
                    obscureText: false,
                    type: TextInputType.text),
                const SizedBox(
                  height: 50,
                ),

                BlocConsumer<MedicationReminderCubit, MedicationReminderState>(
                  listener: (context, state) {
                    if (state is CreateMedicationReminderLoadingState) {
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    if (state is CreateMedicationReminderErrorState) {
                      flutterToast(message: state.error, success: false);
                    }
                    if (state is CreateMedicationReminderSuccessState) {
                      flutterToast(
                          message: AppString.Yourrequestissuccessfullyexecuted,
                          success: true);

                      navigateAndReplacement(context,  const LastAlarmDrugScreen());
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          print(selectedDays);
                          if (formKey.currentState!.validate()) {
                            if (usageSchedulecontroller.text == 'اسبوعياً') {
                              if(selectedDays.isEmpty){
                                flutterToast(message: AppString.pleaseSelectDays, success: false);
                              }else{
                                generateSelectedTimesWithFormat();
                                MedicationReminderCubit.get(context)
                                    .createMedicationReminderWeekly(
                                    medicationName: drugnamecontroller.text,
                                    usageSchedule:
                                    usageSchedulecontroller.text,
                                    days: selectedDays,
                                    times: selectedTimesWithFormat,
                                    endDate: enddatecontroller.text);
                              }

                            } else if (usageSchedulecontroller.text ==
                                'يوميا') {
                              generateSelectedTimesWithFormat();
                              MedicationReminderCubit.get(context)
                                  .createMedicationReminderDaily(
                                  medicationName: drugnamecontroller.text,
                                  usageSchedule:
                                  usageSchedulecontroller.text,
                                  times:selectedTimesWithFormat,
                                  endDate: enddatecontroller.text);
                            } else {
                              MedicationReminderCubit.get(context)
                                  .createMedicationReminderMonthly(
                                  medicationName: drugnamecontroller.text,
                                  usageSchedule:
                                  usageSchedulecontroller.text,
                                  times: [datecontroller.text],
                                  endDate: enddatecontroller.text);
                            }
                          }

                        },
                        child: (state is CreateMedicationReminderLoadingState)
                            ? CircularProgressIndicator(
                          color: AppColors.myWhite,
                        )
                            : CustomElevatedButtonChild(
                          text: "save".tr(context),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<String> selectedTimesWithFormat = [];


  void generateSelectedTimesWithFormat() {
    selectedTimesWithFormat.clear();

    for (int i = 0; i < selectedFieldCount; i++) {
      print('/ / / / / // / / / / / / / / / / / / / / / / / / / / // / / / /  / / / / / / / /  / / /  / // / /  /  / / /  / //');

      print((selectedTimeFormats[i] == "صباحا")?selectedTimes[i]: selectedTimes[i]+12);
      print('/ / / / / // / / / / / / / / / / / / / / / / / / / / // / / / /  / / / / / / / /  / / /  / // / /  /  / / /  / //');
      selectedTimesWithFormat.add((selectedTimeFormats[i] == "صباحا")?"${selectedTimes[i]}:00":"${selectedTimes[i]+12}:00");
    }
  }
  List<int> selectedTimes = List.filled(
      4, 1); // List to store selected times, initialized with default values
  List<String> selectedTimeFormats = List.filled(4,
      'صباحا'); // List to store selected time formats, initialized with default values

  List<Widget> buildTimeFields(int count , bool daily) {
    List<Widget> fields = [];
    List<String> numberOfDose =
    [
      'الأولى',
      'الثانية',
      'الثالثة',
      'الرابعة',
    ];
    for (int i = 0; i < count; i++) {
      fields.add(Row(
        children: [
         if(daily) Text(
            'وقت الجرعه ${numberOfDose[i]}',
            style: Theme
                .of(context)
                .textTheme
                .bodySmall!
                .apply(
              fontSizeFactor: 1.sp,
              color: AppColors.dark,
            ),
          ),
          if(daily)SizedBox(width: 12.w),
          if(daily) const Spacer(),
          if(daily)SizedBox(
            width: 50.w,
            child: DropdownButtonFormField<int>(
              value: selectedTimes[i],
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (int? newValue) {
                setState(() {
                  selectedTimes[i] = newValue!;
                });
              },
              items: List.generate(
                12,
                    (index) =>
                    DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text(
                        '${index + 1}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.dark,
                        ),
                      ),
                    ),
              ),
            ),
          ),
          if(!daily)Expanded(
            child: CustomTextFormField(
                controller: time1controller,
                readOnly: true,
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return AppString.thisFieldCannotBeEmpty;
                  }
                },
                onTap: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(0, 200.h, double.infinity, 0),
                    items: List.generate(12, (index) => PopupMenuItem<int>(
                      value: index +1 ,
                      child: Text('${index +1}'),
                    )),
                    elevation: 8,
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        selectedTimes[0] = value;
                        time1controller.text = value.toString();
                      });
                    }
                  });
                },

                customSuffix: Container(
                    padding: EdgeInsets.all(12.r),
                    width: 18.w,
                    height: 18.h,
                    child: SvgPicture.asset(ImagesPath.timecolock,  width: 18.w,
                      height: 18.h,)),
                label: AppString.time,
                obscureText: false,
                type: TextInputType.number),
          ),
          SizedBox(width: 12.w),
          DropdownButton<String>(
            underline: const SizedBox(),
            value: selectedTimeFormats[i],
            onChanged: (String? newValue) {
              setState(() {
                selectedTimeFormats[i] = newValue!;
              });
            },
            items: <String>['صباحا', 'مساءا']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ));
      if (i < count - 1) {
        fields.add(SizedBox(height: 16.h));
      }
    }
    return fields;
  }

  Widget buildNumberOfFieldsDropdown() {
    return DropdownButton<int>(
      value: selectedFieldCount,
      underline: const SizedBox(),
      onChanged: (int? newValue) {
        setState(() {
          selectedFieldCount = newValue!;
        });
      },
      items: List.generate(
        maxFields,
            (index) =>
            DropdownMenuItem<int>(
              value: index + 1,
              child: Text('${index + 1}' ,    style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall!
                  .apply(
                fontSizeFactor: 1.sp,
                color: AppColors.dark,
              ),),
            ),
      ),
    );
  }

  int maxFields = 4; // Maximum number of fields
  int selectedFieldCount = 1; // Initial number of fields selected by the user
}