import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/controller/medical_details_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_medical_details_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/medical_record_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/custom_add_analysis_details_prescription.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_info_card_widget.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastMedicalDetailsScreen extends StatefulWidget {
  const LastMedicalDetailsScreen({
    super.key,
  });

  @override
  State<LastMedicalDetailsScreen> createState() =>
      _LastMedicalDetailsScreenState();
}

class _LastMedicalDetailsScreenState
    extends State<LastMedicalDetailsScreen> {
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
            sl<MedicalDetailsCubit>()..getMedicalDetails(id: userId),
        child: Scaffold(
          body: Column(
            children: [
              const CustomAppBarTextAndArrowWidget(
                iswhite: false,
                title: AppString.previousmedicaldetails,
                navigateToBottomNav: true,
                widgetnavigate: MedicalRecordScreen(),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 470.h,
                      margin: EdgeInsets.symmetric(
                          horizontal: 24.r, vertical: 48.r),
                      child:
                          BlocBuilder<MedicalDetailsCubit, MedicalDetailsState>(
                              builder: (context, state) {
                        return state is! GetAllMedicalDetailsLoadingState
                            ? (MedicalDetailsCubit.get(context)
                                    .dataMedical
                                    .isNotEmpty)
                                ? ListView.builder(
                                    itemCount: MedicalDetailsCubit.get(context)
                                        .dataMedical
                                        .length,
                                    itemBuilder: (context, index) {
                                      final data =
                                          MedicalDetailsCubit.get(context)
                                              .dataMedical[index];
                                      return MedicalInfoCard(userName: userName, data: data, userId: userId);
                                    })
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          height: 274.35.h,
                                          width: 154.89.w,
                                          ImagesPath.imagedetails,
                                        ),
                                        Text(
                                          'لا توجد تفاصيل طبيه سابقه ',
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
                      }),
                    ),
                    CustomAddAnalysisdetailsPrescription(
                      onTap: () {
                        navigateTo(context, CreateMedicalDetailsScreen());
                      },
                    ),
                    const CustomBottomCurvyCircles(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



