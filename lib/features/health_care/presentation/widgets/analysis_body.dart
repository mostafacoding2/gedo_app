import 'dart:io';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/controller/test_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/item_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AnalysisBodyScreen extends StatefulWidget {
  const AnalysisBodyScreen({super.key});

  @override
  State<AnalysisBodyScreen> createState() => _AnalysisBodyScreenState();
}

class _AnalysisBodyScreenState extends State<AnalysisBodyScreen> {
  Color color = AppColors.lightprimaryColor;
  bool iscolored = false;
  TextEditingController datecontroller = TextEditingController();
  TextEditingController analysistypecontroller = TextEditingController();
  TextEditingController Laboratorynamecontroller = TextEditingController();
  TextEditingController namedoctorcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    datecontroller.dispose();
    analysistypecontroller.dispose();
    Laboratorynamecontroller.dispose();
    namedoctorcontroller.dispose();
    super.dispose();
  }

  bool isshow = false;

  void addImage() {
    if (isshow == false) {
      showDialog(
          barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
          context: context,
          builder: (BuildContext context) {
            return const ItemMessage(
              title: AppString.Youmustenterimageanalyiss,
            );
          }).then((value) {
        if (value == null || !value) {
          // Handle cancel
          print('User canceled');
        } else {
          // Handle sure
          print('User clicked Sure');
          setState(() {
            isshow = true;
          });
          ImagePicker()
              .pickImage(source: ImageSource.camera)
              .then((value) => TestCubit.get(context).pickImage(value!));
        }
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: 348.r, start: 12.69.r),
                  child: SvgPicture.asset(ImagesPath.imageAnalysis)),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24.r),
                child: Column(
                  children: [
                    SizedBox(
                      height: 39.h,
                    ),
                    CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter} ${AppString.date}";
                        } else {
                          return null;
                        }
                      },
                      readOnly: true,
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          initialDate: DateTime.now(),
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            datecontroller.text =
                                DateFormat('yyyy-MM-dd').format(picked);
                          });
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
                                firstDate: DateTime(2000),
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
                      obscureText: false,
                      type: TextInputType.number,
                      label: AppString.date,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter} ${AppString.analysistype}";
                        } else {
                          return null;
                        }
                      },
                      controller: analysistypecontroller,
                      obscureText: false,
                      type: TextInputType.text,
                      label: AppString.analysistype,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter} ${AppString.Laboratoryname}";
                        } else {
                          return null;
                        }
                      },
                      controller: Laboratorynamecontroller,
                      obscureText: false,
                      type: TextInputType.text,
                      label: AppString.Laboratoryname,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter} ${AppString.namedoctor}";
                        } else {
                          return null;
                        }
                      },
                      controller: namedoctorcontroller,
                      obscureText: false,
                      type: TextInputType.text,
                      label: AppString.namedoctor,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                   Padding(
                            padding: EdgeInsetsDirectional.only(end: 287.r),
                            child: BlocBuilder<TestCubit, TestState>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: ()
                                  {
                                    ImagePicker()
                                        .pickImage(source: ImageSource.camera)
                                        .then((value) => TestCubit.get(context).pickImage(value!));
                                  },

                                  child: SizedBox(
                                    width: 64.w,
                                    height: 64.h,
                                    child: TestCubit.get(context).imagepicker ==
                                            null
                                        ? SvgPicture.asset(
                                            ImagesPath.FormAnalysis)
                                        : Image.file(File(TestCubit.get(context)
                                            .imagepicker!
                                            .path)),
                                  ),
                                );
                              },
                            ))
                   ,
                    SizedBox(
                      height: 49.h,
                    ),
                    BlocConsumer<TestCubit, TestState>(
                      listener: (context, state) {
                        if (state is CreateTestLoadingState) {
                          Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        }
                        if (state is CreateTestErrorState) {
                          flutterToast(message: state.error, success: false);
                        }
                        if (state is CreateTestSuccessState) {
                          navigateAndRemove(
                              context, const LastAnalysisScreen());
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    iscolored ? color : AppColors.primaryColor),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  iscolored = false;
                                });
TestCubit.get(context).imagepicker == null?addImage():
                                TestCubit.get(context).createTest(
                                  date: datecontroller.text,
                                  testName: analysistypecontroller.text,
                                  laboratoryName: Laboratorynamecontroller.text,
                                  attendingPhysician: namedoctorcontroller.text,
                                );

                                setState(() {});
                              }
                            },
                            child: (state is CreateTestLoadingState)
                                ? CircularProgressIndicator(
                                    color: AppColors.myWhite,
                                  )
                                : CustomElevatedButtonChild(
                                    text: "save".tr(context),
                                  ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
