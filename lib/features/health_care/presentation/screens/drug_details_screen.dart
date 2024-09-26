import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/controller/drug_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/drug_details_result_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/health_care_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_medical_details_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_prescriptions_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_medical_details_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_prescription_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/read_medicine_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/home_item_widget.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrugDetailsScreen extends StatefulWidget {
  const DrugDetailsScreen({super.key});

  @override
  State<DrugDetailsScreen> createState() => _DrugDetailsScreenState();
}

class _DrugDetailsScreenState extends State<DrugDetailsScreen> {
  var formKey = GlobalKey<FormState>();
  var drugNameController = TextEditingController();

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
                title: AppString.drugDetails,
                navigateToBottomNav: true,
                Screen: const ReadMedicineScreen(),
              ),
              Stack(
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
                            height: 150.h,
                          ),
                          CustomTextFormField(
                            obscureText: false,
                            type: TextInputType.text,
                            hintText: AppString.drugname,
                            controller: drugNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.thisFieldCannotBeEmpty;
                              }
                            },
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          BlocProvider(
                            create: (context) => DrugCubit(),
                            child: BlocConsumer<DrugCubit, DrugState>(
                              listener: (context, state) {
                                if (state is DrugInfoSuccessState) {
                                  navigateTo(
                                      context,  DrugInfoResultScreen(drugInfoModel: DrugCubit.get(context).drugInfoModel!,));
                                }
                                if (state is DrugInfoErrorState) {
                                  flutterToast(
                                      message: state.message, success: false);
                                }
                              },
                              builder: (context, state) {
                                var cubit = DrugCubit.get(context);

                                return SizedBox(
                                    width: double.infinity,
                                    height: 48.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.drugInfo(
                                            drugName: drugNameController.text,
                                          );
                                        }
                                      },
                                      child: state is DrugInfoLoadingState
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const CustomElevatedButtonChild(
                                              text: AppString.send,
                                            ),
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
