import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/controller/medical_details_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_medical_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class MedicalDetailsBody extends StatefulWidget {
  const MedicalDetailsBody({super.key});
  @override
  State<MedicalDetailsBody> createState() => _MedicalDetailsBodyState();
}
class _MedicalDetailsBodyState extends State<MedicalDetailsBody> {
  TextEditingController controllertypeblood = TextEditingController();
  TextEditingController controllerAllergies = TextEditingController();
  TextEditingController controllerChronicdisease = TextEditingController();
  TextEditingController controllerdrugname1 = TextEditingController();
  TextEditingController controllerdrugname2 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Color color = AppColors.lightprimaryColor;
  bool yesSelected = false;
  bool noSelected = false;
  bool isselected = false;
  bool iscolored=false;

  @override
  void dispose() {
    controllertypeblood.dispose();
    controllerAllergies.dispose();
    controllerChronicdisease.dispose();
    controllerdrugname1.dispose();
    controllerdrugname2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 335.r),
            child: SvgPicture.asset(
              ImagesPath.imagedetails,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 39.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "${AppString.YouMustEnter} ${AppString.typeblood}";
                    } else {
                      return null;
                    }
                  },

                  controller: controllertypeblood,
                  obscureText: false,
                  type: TextInputType.text,
                  label: AppString.typeblood,
                ),
                SizedBox(
                  height: 21.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "${AppString.YouMustEnter} ${AppString.Allergies} ";
                    } else {
                      return null;
                    }
                  },
                  controller: controllerAllergies,
                  obscureText: false,
                  type: TextInputType.text,
                  label: AppString.Allergies,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "${AppString.YouMustEnter} ${AppString.chronicdisease}";
                    } else {
                      return null;
                    }
                  },
                  controller: controllerChronicdisease,
                  obscureText: false,
                  type: TextInputType.text,
                  label: AppString.chronicdisease,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.Aretheremedications,
                      style: Theme.of(context).textTheme.displaySmall!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.dark,
                          ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            focusColor: AppColors.primaryColor,
                            activeColor: AppColors.primaryColor,
                            side: BorderSide(
                              color: AppColors.dark,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: yesSelected,
                            onChanged: (value) {
                              yesSelected = value!;
                              setState(() {
                                yesSelected = true;
                                noSelected = false;
                                isselected = true;
                              });
                            }),
                        Text(
                          AppString.yes,
                          style:
                              Theme.of(context).textTheme.displaySmall!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.dark,
                                  ),
                        ),
                        SizedBox(
                          width: 57.w,
                        ),
                        Checkbox(
                            activeColor: AppColors.primaryColor,
                            splashRadius: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            side: BorderSide(
                              color: AppColors.dark,
                              width: 1,
                            ),
                            value: noSelected,
                            onChanged: (value) {
                              noSelected = value!;
                              setState(() {
                                yesSelected = false;
                                noSelected = true;
                                isselected = false;
                              });
                            }),
                        Text(
                          AppString.no,
                          style:
                              Theme.of(context).textTheme.displaySmall!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.dark,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "${AppString.YouMustEnter} ${AppString.drugname}";
                    } else {
                      return null;
                    }
                  },
                  controller: controllerdrugname1,
                  obscureText: false,
                  type: TextInputType.text,
                  label: AppString.drugname,
                ),
                SizedBox(
                  height: 16.h,
                ),
                isselected
                    ? CustomTextFormField(
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return "${AppString.YouMustEnter} ${AppString.drugname}";
                    } else {
                      return null;
                    }
                  },
                        controller: controllerdrugname2,
                        obscureText: false,
                        type: TextInputType.text,
                        label: AppString.drugname,
                      )
                    : Container(),
                SizedBox(
                  height: 57.h,
                ),
                BlocConsumer<MedicalDetailsCubit, MedicalDetailsState>(
                  listener: (context, state) {

                    if (state is CreateMedicalDetailsSuccessState) {
                      flutterToast(
                          message:
                              AppString.Yourrequestissuccessfullyexecuted,
                          success: true);
                      setState(() {
                        navigateAndRemove(
                            context, LastMedicalDetailsScreen());
                      });
                    }
                    if (state is CreateMedicalDetailsErrorState) {
                      flutterToast(message: state.error is List ? state.error[0] : state.error, success: false);
                    }
                  },
                  builder: (context, state) {

                    return SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor:iscolored?color:AppColors.primaryColor),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              iscolored = false;
                            });
                            MedicalDetailsCubit.get(context).createMedicalDetails(
                              controllerdrugname2.text,
                              bloodType: controllertypeblood.text,
                              sensitivities: controllerAllergies.text,
                              chronicDiseases: controllerChronicdisease.text,
                              permanentMedications: isselected,
                              name1: controllerdrugname1.text,
                            );
                            setState(() {

                            });
                          }
                        },
                        child: (state is CreateMedicalDetailsLoadingState)
                            ? CircularProgressIndicator(
                          color: AppColors.myWhite,)
                            : CustomElevatedButtonChild(text: "save".tr(context),),),
                    );

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
