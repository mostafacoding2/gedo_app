import 'dart:io';

import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/controller/home_cubit.dart';
import 'package:alzcare/features/home_data/presentation/screens/direction_diagnosis_skin%20desies_diseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/result_diagnosis_skin_desies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CameraDiagnosisSkinDesiesDiseasesScreen extends StatelessWidget {
  const CameraDiagnosisSkinDesiesDiseasesScreen({super.key, required this.pickedImage, required this.modelName});
  final XFile pickedImage;
  final String modelName;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => sl<HomeCubit>(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context , state)
            {
              if(state is DetectionSuccessState){
                navigateTo(
                    context,  ResultDiagnosisSkinDesiesScreen(detectionModel: HomeCubit.get(context).detectionModel,pickedImage: HomeCubit.get(context).pickedImage!, modelName: modelName,));
              }
            },
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              cubit.pickedImage ??= pickedImage;
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 375.w,
                        height: 475.h,
                        decoration: BoxDecoration(
                            color: AppColors.myWhite,
                            borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(16.r),
                                bottomStart: const Radius.circular(16))),
                        padding: EdgeInsetsDirectional.only(top: 60.h),
                        child:Image.file(
                          File(cubit.pickedImage!.path),
                          fit: BoxFit.contain,
                        ),
                      ),
                      // PositionedDirectional(
                      //     top: 32.r,
                      //     end: 32.r,
                      //     start: 319.w,
                      //     child: Container(
                      //       child: IconButton(
                      //         icon: Icon(
                      //           size: 24.r,
                      //          Icons.arrow_forward_ios,
                      //           color: AppColors.primaryColor,
                      //         ),
                      //         onPressed: () {
                      //           Navigator.pop(context);
                      //         },
                      //       ),
                      //     ))
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: ()
                          {
                            cubit.imagePicker(context);
                          },
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.only(top: 97.r, start: 55.r),
                            child: SvgPicture.asset(
                                width: 35.w, height: 35.h, ImagesPath.Return),
                          )),
                      GestureDetector(
                          onTap: () {
                            if(modelName == AppString.Whitewater)
                            {
                             cubit.detectWhiteWaterDisease();
                            }else{
                             cubit.detectSkinDisease();
                            }
                          },
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.only(top: 97.r, start: 50.r),
                            child: state is DetectionLoadingState ? CircularProgressIndicator(color: AppColors.primaryColor,):SvgPicture.asset(
                                width: 95.w,
                                height: 95.h,
                                ImagesPath.diagnosis),
                          )),
                      // GestureDetector(
                      //     onTap: () {},
                      //     child: Padding(
                      //       padding:
                      //       EdgeInsetsDirectional.only(top: 127.r, start: 50.r),
                      //       child: SvgPicture.asset(
                      //           width: 35.h, height: 35.h, ImagesPath.addimage),
                      //     )),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
