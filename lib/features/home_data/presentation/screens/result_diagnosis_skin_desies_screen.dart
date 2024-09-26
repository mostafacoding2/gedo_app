import 'dart:io';

import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/home_data/model/detection_model.dart';
import 'package:alzcare/features/home_data/presentation/screens/camera_diagnosis_skin_desies_diseases_screen.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/services.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ResultDiagnosisSkinDesiesScreen extends StatelessWidget {
  ResultDiagnosisSkinDesiesScreen(
      {super.key,
      required this.detectionModel,
      required this.pickedImage,
      required this.modelName});

  final DetectionModel detectionModel;
  final XFile pickedImage;
  final String modelName;

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: AppColors.myWhite,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    );
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size(double.infinity, 78.h),
                child: AppBar(
                  leading: InkWell(
                      onTap: () {
                        navigateAndReplacement(
                            context,
                            CameraDiagnosisSkinDesiesDiseasesScreen(
                              pickedImage: pickedImage,
                              modelName: modelName,
                            ));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24.r,
                        color: AppColors.dark,
                      )),
                )),
            body: WillPopScope(
              onWillPop: () async {
                navigateAndReplacement(
                    context,
                    CameraDiagnosisSkinDesiesDiseasesScreen(
                      pickedImage: pickedImage,
                      modelName: modelName,
                    ));
                return false;
              },
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 24.r),
                          child: Column(
                            children: [
                              Container(
                                width: 327.w,
                                height: 250.h,
                                margin: EdgeInsetsDirectional.only(top: 48.r),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.all(
                                        Radius.circular(16))),
                                child: Image.file(
                                  File(pickedImage.path),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(detectionModel.detectionMessage,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .apply(
                                        fontSizeFactor: 1.1.sp,
                                        color: AppColors.primaryColor,
                                      )),
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                width: 301,
                                height: 2,
                                color: const Color.fromRGBO(235, 237, 237, 1),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: AppColors.lightprimaryColor,
                                    size: 16.r,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    """ من فضلك أستشر طبيبك""",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .apply(
                                          fontSizeFactor: 1.1.sp,
                                          color: AppColors.dark,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // PositionedDirectional(
                        //   top: 462.h,
                        //   start: 24.r,
                        //   end: 24.r,
                        //   child: CustomButton(
                        //     containerColor: AppColors.primaryColor,
                        //     text: "save",
                        //     onPressed: () {
                        //       navigateTo(
                        //           context, const ListviewResultSkinDeseasesScreen());
                        //     },
                        //   ),
                        // ),
                        const CustomBottomCurvyCircles()
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
