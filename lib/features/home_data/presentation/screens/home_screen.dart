import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/Medication%20Reminder/presentation/screens/last_alarms_drug_screen.dart';
import 'package:alzcare/features/health_care/presentation/screens/health_care_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/diseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/view_content_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/home_item_widget.dart';
import 'package:alzcare/features/ocr_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: InteractiveViewer(
        minScale: 0.1,
        maxScale: 4.0,
        child: Column(
          children: [
            userType == '3'
                ? Container(
                    width: double.infinity,
                    height: 288.h,
                    margin: EdgeInsetsDirectional.only(bottom: 24.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(16.r),
                        bottomEnd: Radius.circular(16.r),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        ImagesPath.homeCareGiver,
                        width: 140.w,
                        height: 200.h,
                      ),
                    ),
                  )
                : Container(
                    width: 375.w,
                    height: 297.h,
                    padding: EdgeInsetsDirectional.only(end: 75.w),
                    child: Stack(children: [
                      ClipPath(
                          clipper: containerclipper(),
                          child: Container(color: const Color(0xffE5EFF0))),
                      PositionedDirectional(
                        end: 150.r,
                        top: 59.r,
                        child: SvgPicture.asset(
                          ImagesPath.appBar1,
                          width: 140.w,
                          height: 180.h,
                        ),
                      )
                    ])),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: (userType == '3')
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              HomeScreenItemWidget(
                                onTap: () {
                                  navigateTo(
                                      context, const LastAlarmDrugScreen());
                                },
                                imagePath: ImagesPath.drugAlarm,
                                text: AppString.drugAlarm,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Row(
                            children: [
                              HomeScreenItemWidget(
                                onTap: () {
                                  navigateTo(context, const HealthCareScreen());
                                },
                                imagePath: ImagesPath.healthcare,
                                text: AppString.healthcare,
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: HomeScreenItemWidget(
                                  onTap: () {
                                    navigateTo(
                                        context, const HealthCareScreen());
                                  },
                                  imagePath: ImagesPath.healthcare,
                                  text: AppString.healthcare,
                                ),
                              ),
                              SizedBox(
                                width: 31.w,
                              ),
                              Expanded(
                                child: HomeScreenItemWidget(
                                  onTap: () {
                                    navigateTo(context, OcrModelScreen());
                                  },
                                  imagePath: ImagesPath.viewContent,
                                  text: AppString.audioReading,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: HomeScreenItemWidget(
                                  onTap: ()
                                  {
                                    navigateTo(context, const DiseasesScreen());
                                  },
                                  imagePath: ImagesPath.diseases,
                                  text: AppString.diseases,
                                ),
                              ),
                              SizedBox(
                                width: 31.w,
                              ),
                              Expanded(
                                child: HomeScreenItemWidget(
                                  onTap: () {
                                    navigateTo(
                                        context, const LastAlarmDrugScreen());
                                  },
                                  imagePath: ImagesPath.drugAlarm,
                                  text: AppString.drugAlarm,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class containerclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(217.302, -0.0345345);
    path_0.cubicTo(193.325, -1.0232, 170.471, -10.2072, 148.681, -20.2532);
    path_0.cubicTo(126.891, -30.2993, 105.294, -41.432, 81.8783, -46.7553);
    path_0.cubicTo(66.8237, -50.183, 49.6065, -50.6651, 37.4787, -41.0889);
    path_0.cubicTo(25.8055, -31.8762, 22.0349, -15.9717, 20.0067, -1.21522);
    path_0.cubicTo(18.4813, 9.88894, 17.5963, 21.5732, 21.7663, 31.9706);
    path_0.cubicTo(24.6691, 39.1854, 29.8205, 45.2523, 33.3845, 52.1648);
    path_0.cubicTo(45.7808, 76.2156, 37.0173, 105.876, 23.581, 129.379);
    path_0.cubicTo(17.2795, 140.41, 9.96911, 150.905, 5.10698, 162.634);
    path_0.cubicTo(0.244847, 174.364, -2.00716, 187.8, 2.24893, 199.763);
    path_0.cubicTo(6.46714, 211.61, 16.5151, 220.525, 27.4032, 226.788);
    path_0.cubicTo(49.517, 239.497, 75.5734, 243.133, 100.983, 245.217);
    path_0.cubicTo(157.228, 249.78, 213.776, 247.803, 270.169, 245.826);
    path_0.cubicTo(291.039, 245.09, 312.003, 244.351, 332.533, 240.515);
    path_0.cubicTo(343.934, 238.386, 355.707, 235.012, 363.985, 226.865);
    path_0.cubicTo(374.491, 216.521, 377.098, 199.011, 370.056, 186.04);
    path_0.cubicTo(358.245, 164.289, 325.591, 158.884, 317.333, 135.54);
    path_0.cubicTo(312.792, 122.691, 317.457, 108.376, 324.062, 96.4588);
    path_0.cubicTo(338.225, 70.8964, 361.971, 48.4675, 363.221, 19.2445);
    path_0.cubicTo(364.082, -0.827103, 352.667, -20.9233, 335.016, -30.4218);
    path_0.cubicTo(316.517, -40.3862, 290.864, -39.1279, 277.217, -22.6596);
    path_0.cubicTo(263.165, -5.69283, 238.469, 0.835659, 217.302, -0.0345345);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
