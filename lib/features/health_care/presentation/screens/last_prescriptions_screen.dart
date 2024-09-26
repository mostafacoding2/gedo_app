import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/controller/prescription_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/medical_record_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_prescription_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/result_prescription_Screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/custom_add_analysis_details_prescription.dart';
import 'package:alzcare/features/health_care/presentation/widgets/item_analysis%20and%20prescription.dart';
import 'package:alzcare/features/health_care/presentation/widgets/sure_delete_dialog.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastPrescriptionsScreen extends StatefulWidget {
  const LastPrescriptionsScreen({super.key});

  @override
  State<LastPrescriptionsScreen> createState() =>
      _LastPrescriptionsScreenState();
}

class _LastPrescriptionsScreenState
    extends State<LastPrescriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            sl<PrescriptionCubit>()..getAllPrescription(id: userId),
        child: Scaffold(
            body: Column(children: [
          const CustomAppBarTextAndArrowWidget(
            iswhite: false,
            title: AppString.lastprescription,
            navigateToBottomNav: true,
            widgetnavigate: MedicalRecordScreen(),
          ),
          Expanded(
              child: Stack(children: [
            Container(
                height: 470.h,
                margin: EdgeInsets.symmetric(horizontal: 24.r, vertical: 40.r),
                child: BlocConsumer<PrescriptionCubit, PrescriptionState>(
                  listener: (context, state) {
                    if (state
                    is DeletePrescriptionErrorState) {
                      flutterToast(
                          message: state.error,
                          success: false);
                    }
                    if (state
                    is DeletePrescriptionSuccessState) {
                      flutterToast(
                          message: AppString.Deleted,
                          success: true);
                      PrescriptionCubit.get(context)
                          .getAllPrescription(id: userId);
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var cubit = PrescriptionCubit.get(context);
                    return state is! GetAllPrescriptionLoadingState
                        ? (PrescriptionCubit.get(context)
                                .dataPrescription
                                .isNotEmpty)
                            ? ListView.builder(
                                itemCount: PrescriptionCubit.get(context)
                                    .dataPrescription
                                    .length,
                                itemBuilder: (context, index) {
                                  var data = PrescriptionCubit.get(context)
                                      .dataPrescription[index];
                                  return ItemAnalysisPrescription(
                                    title: AppString.namedoctor,
                                    textWeight: 120,
                                    content: data.attendingPhysician,
                                    onTap: () {
                                      navigateTo(
                                          context,
                                          ResultPrescriptionScreen(
                                              id: data.id));
                                    },
                                    urlImage: data.prescriptionImage!.url,
                                    date: data.date,
                                    deleteClick: () {
                                      showDialog(
                                          barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return  DeleteItemSureDialog(
                                              title: "هل متأكد من حذف هذا",
                                              onPressed: ()
                                              {
                                               cubit
                                                    .deletePrescription(
                                                    id: data.id);
                                                Navigator.pop(context);
                                              },
                                            );});

                                    },
                                  );
                                })
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      height: 274.35.h,
                                      width: 154.89.w,
                                      ImagesPath.prescriptionimage,
                                    ),
                                    Text(
                                      'لا توجد الروشتات السابقه ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .apply(
                                            fontSizeFactor: 1.1.sp,
                                            color: const Color.fromRGBO(
                                                197, 213, 213, 1),
                                          ),
                                    )
                                  ],
                                ),
                              )
                        : Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryColor),
                          );
                  },
                )),
            CustomAddAnalysisdetailsPrescription(
              onTap: () {
                navigateTo(context, const CreatePrescriptionScreen());
              },
            ),
            const CustomBottomCurvyCircles(),
          ]))
        ])),
      ),
    );
  }
}
