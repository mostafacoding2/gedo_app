import 'dart:io';
import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/health_care/presentation/controller/prescription_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_prescriptions_screen.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/widgets/item_warning.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PrescriptionBodyScreen extends StatefulWidget {
  const PrescriptionBodyScreen({super.key});

  @override
  State<PrescriptionBodyScreen> createState() => _PrescriptionBodyScreenState();
}

class _PrescriptionBodyScreenState extends State<PrescriptionBodyScreen> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();
  TextEditingController namedoctorcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Color color = AppColors.lightprimaryColor;
  bool iscolored = false;
  bool isshow = false;

  void addImage() {
    if (isshow == false) {
      showDialog(
          barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
          context: context,
          builder: (BuildContext context) {
            return const ItemMessage(
              title: AppString.Youmustenterimageprescription,
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
          ImagePicker().pickImage(source: ImageSource.camera).then(
              (value) => PrescriptionCubit.get(context).pickImage(value!));
        }
      });
    } else {
      return;
    }
  }

  @override
  void dispose() {
    datecontroller.dispose();
    notescontroller.dispose();
    namedoctorcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
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
                  padding: EdgeInsetsDirectional.only(start: 169.r, top: 381.r),
                  child: SvgPicture.asset(
                    ImagesPath.prescriptionimage,
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 24.r,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 39.h,
                    ),
                    CustomTextFormField(
                      readOnly: true,
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter} ${AppString.date}";
                        } else {
                          return null;
                        }
                      },
                      controller: datecontroller,
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
                      customSuffix: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                initialDate: DateTime.now(),
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
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
                      type: TextInputType.text,
                      label: AppString.date,
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextFormField(
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter} ${AppString.notes}";
                        } else {
                          return null;
                        }
                      },
                      controller: notescontroller,
                      obscureText: false,
                      type: TextInputType.text,
                      label: AppString.notes,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomTextFormField(
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
                            child: BlocBuilder<PrescriptionCubit,
                                PrescriptionState>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
                                    ImagePicker()
                                        .pickImage(source: ImageSource.camera)
                                        .then((value) =>
                                            PrescriptionCubit.get(context)
                                                .pickImage(value!));
                                  },
                                  child: SizedBox(
                                    width: 64.w,
                                    height: 64.h,
                                    child: PrescriptionCubit.get(context)
                                                .imagepicker ==
                                            null
                                        ? SvgPicture.asset(
                                            fit: BoxFit.fill,
                                            ImagesPath.FormAnalysis)
                                        : Image.file(
                                            fit: BoxFit.fill,
                                            File(PrescriptionCubit.get(context)
                                                .imagepicker!
                                                .path)),
                                  ),
                                );
                              },
                            )),

                    SizedBox(
                      height: 49.h,
                    ),
                    BlocConsumer<PrescriptionCubit, PrescriptionState>(
                        listener: (context, state) {
                      if (state is CreatePrescriptionLoadingState)
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        );
                      if (state is CreatePrescriptionErrorState)
                        flutterToast(message: state.error, success: false);
                      if (state is CreatePrescriptionSuccessState)
                        navigateAndRemove(
                            context, const LastPrescriptionsScreen());
                    }, builder: (context, state) {
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
                              (PrescriptionCubit.get(context).imagepicker ==
                                      null)
                                  ? addImage()
                                  : PrescriptionCubit.get(context)
                                      .createPrescription(
                                          date: datecontroller.text,
                                          notes: notescontroller.text,
                                          attendingPhysician:
                                              namedoctorcontroller.text);

                              setState(() {});
                            }
                          },
                          child: (state is CreatePrescriptionLoadingState)
                              ? CircularProgressIndicator(
                                  color: AppColors.myWhite,
                                )
                              : CustomElevatedButtonChild(
                                  text: "save".tr(context),
                                ),
                        ),
                      );
                    })
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
