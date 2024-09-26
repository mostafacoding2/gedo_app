import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/presentation/controller/test_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/create_analysis_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/medical_record_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/result_analysis_Screen.dart';
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

class LastAnalysisScreen extends StatefulWidget {
  const LastAnalysisScreen({
    super.key,
  });

  @override
  State<LastAnalysisScreen> createState() =>
      _LastAnalysisScreenState();
}

class _LastAnalysisScreenState
    extends State<LastAnalysisScreen> {
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
        create: (context) => sl<TestCubit>()..getAllTests(id: userId),
        child: Scaffold(
            body: Column(children: [
          const CustomAppBarTextAndArrowWidget(
            iswhite: false,
            title: AppString.lastanalysis,
            navigateToBottomNav: true,
            widgetnavigate: MedicalRecordScreen(),
          ),
          Expanded(
              child: Stack(children: [
            Container(
                height: 470.h,
                margin: EdgeInsets.symmetric(horizontal: 24.r, vertical: 40.r),
                child: BlocConsumer<TestCubit, TestState>(
                  listener: (context, state) {
                    if (state is DeleteTestErrorState) {
                      flutterToast(
                          message: state.error,
                          success: false);
                    }
                    if (state is DeleteTestSuccessState) {
                      flutterToast(
                          message: AppString.Deleted,
                          success: true);
                      TestCubit.get(context)
                          .getAllTests(id: userId);
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var cubit = TestCubit.get(context);
                    return state is! GetAllTestLoadingState
                        ? (TestCubit.get(context).dataTest.isNotEmpty)
                            ? ListView.builder(
                                itemCount:
                                    TestCubit.get(context).dataTest.length,
                                itemBuilder: (context, index) {
                                  var data =
                                      TestCubit.get(context).dataTest[index];
                                  return ItemAnalysisPrescription(
                                    onTap: () {
                                      navigateTo(context,
                                          ResultAnalysisScreen(id: data.Id));
                                    },
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
                                                    .deleteTests(id: data.Id);
                                                setState(() {
                                                cubit
                                                      .getAllTests(id: userId);
                                                });
                                                Navigator.pop(context);
                                              },
                                            );});
                                    },
                                    urlImage: data.testImage!.url,
                                    date: data.date,
                                    content: data.testName,
                                    title: AppString.analysistype,
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
                                      ImagesPath.imageAnalysis,
                                    ),
                                    Text(
                                      'لا توجد تحاليل  سابقه ',
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
                navigateTo(context, CreateAnalysisScreen());
              },
            ),
            const CustomBottomCurvyCircles(),
          ]))
        ])),
      ),
    );
  }
}
