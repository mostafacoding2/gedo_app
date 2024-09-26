import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/controller/drug_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/health_care_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/read_medicine_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrugInteractionScreen extends StatefulWidget {
  const DrugInteractionScreen({super.key});

  @override
  State<DrugInteractionScreen> createState() => _DrugInteractionScreenState();
}

class _DrugInteractionScreenState extends State<DrugInteractionScreen> {
  var formKey = GlobalKey<FormState>();
  var newDrugNameController = TextEditingController();
  var oldDrugNameController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicalRecordAndDetailsWidgetInTopOfScreen(
                iswhite: true,
                containerHeight: 203,
                title: AppString.drugInteractions,
                navigateToBottomNav: true,
                Screen: const ReadMedicineScreen(),
              ),
              BlocProvider(
                create: (context) => DrugCubit(),
                child: BlocConsumer<DrugCubit, DrugState>(
                  listener: (context, state) {
                    if (state is DrugInteractionSuccessState) {
                      _showDialog(context, DrugCubit.get(context).drugInteractionModel!.message.toString(),);
                    }
                    if (state is DrugInteractionErrorState) {
                      _showDialog(context, state.message,
                          );
                    }
                  },
                  builder: (context, state) {
                    var cubit = DrugCubit.get(context);
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 335.r),
                          child: SvgPicture.asset(
                            ImagesPath.imagedetails,
                            height: 235.h,
                            width: 154.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100.h,
                                ),
                                CustomTextFormField(
                                  obscureText: false,
                                  type: TextInputType.text,
                                  hintText: AppString.newDrugName,
                                  controller: newDrugNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.thisFieldCannotBeEmpty;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 32.h,
                                ),
                                CustomTextFormField(
                                  obscureText: false,
                                  type: TextInputType.text,
                                  hintText: AppString.oldDrugName,
                                  controller: oldDrugNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.thisFieldCannotBeEmpty;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 60.h,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    height: 48.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.drugInteraction(
                                              drugName:
                                                  oldDrugNameController.text,
                                              secondDrugName:
                                                  newDrugNameController.text);
                                        }
                                      },
                                      child: state is DrugInteractionLoadingState? const CircularProgressIndicator(color: Colors.white,):  const CustomElevatedButtonChild(
                                        text: AppString.send,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void _showDialog(BuildContext context, String title, ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(fontSizeFactor: 1.1.sp,  color: AppColors.primaryColor, ).copyWith(height: 1.75),
          textAlign: TextAlign.center,
        ),
        content: null,
        actions: <Widget>[
          TextButton(
            child: Text(
              AppString.cancel,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .apply(fontSizeFactor: 1.sp, color: AppColors.dark),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
