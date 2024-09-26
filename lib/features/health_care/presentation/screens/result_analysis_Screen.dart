import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/health_care/presentation/controller/test_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_analysis_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class ResultAnalysisScreen extends StatefulWidget {
  final String id;
  const ResultAnalysisScreen({super.key, required this.id});
  @override
  State<ResultAnalysisScreen> createState() => _ResultAnalysisScreenState();
}
class _ResultAnalysisScreenState extends State<ResultAnalysisScreen> {
  bool isloading = true;
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
      create: (context) => sl<TestCubit>()..getTest(id: widget.id),
      child: Scaffold(
          body: BlocConsumer<TestCubit, TestState>(
        listener: (context, state) {
          if (state is GetTestLoadingState) {
            Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          if (state is GetTestErrorState) {
            flutterToast(message: state.error, success: false);
          }
          if (state is GetTestSuccessState) {
            setState(() {
              isloading = false;
            });
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = TestCubit.get(context).testEntite;
          return cubit == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    CustomAppBarTextAndArrowWidget(
                      iswhite: false,
                      title: cubit.data!.testName,
                      navigateToBottomNav: true,
                      widgetnavigate: const LastAnalysisScreen(),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.symmetric(
                                horizontal: 24.r),
                            child: Column(
                              children: [
                                Container(
                                    width: 327.w,
                                    height: 250.h,
                                    margin:
                                        EdgeInsetsDirectional.only(top: 48.r),
                                    decoration: const BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                                Radius.circular(16))),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: cubit.data!.testImage!.url,
                                      placeholder:  (context, url) => Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      ),

                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error,
                                              color: AppColors.myRedLight),
                                    )
                                ),
                                SizedBox(
                                  height: 31.h,
                                ),
                                RowText(
                                    title: AppString.date,
                                    content: cubit.data!.date.split('T').first),
                                SizedBox(
                                  height: 8.h,
                                ),
                                RowText(
                                  title: AppString.analysistype,
                                  content: cubit.data!.testName,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                RowText(
                                  title: AppString.Laboratoryname,
                                  content: cubit.data!.laboratoryName,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                RowText(
                                  title: AppString.namedoctor,
                                  content: cubit.data!.attendingPhysician,
                                )
                              ],
                            ),
                          ),
                          const CustomBottomCurvyCircles()
                        ],
                      ),
                    )
                  ],
                );
        },
      )),
    ));
  }
  Widget RowText({required String title, required String content}) => Row(
        children: [
          Text(
            '${title} :',
            style: lightTheme.textTheme.bodySmall!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: 8.h,
          ),
          Text(
            content,
            style: lightTheme.textTheme.bodySmall!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.dark,
            ),
          ),
        ],
      );
}