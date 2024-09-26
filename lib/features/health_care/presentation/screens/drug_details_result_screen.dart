import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/health_care/data/model/drug_info_model.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrugInfoResultScreen extends StatelessWidget {
  const DrugInfoResultScreen({super.key, required this.drugInfoModel});

  final DrugInfoModel drugInfoModel;

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
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBarTextAndArrowWidget(
                iswhite: false,
                title: AppString.drugDetails,
                navigateToBottomNav: false,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 500.r),
                    child: SvgPicture.asset(
                      ImagesPath.imagedetails,
                      height: 250.h,
                      width: 170.w,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 40.h),
                    child: Column(
                      children: [
                        if( drugInfoModel.name.toString() != '') DrugInfoResultWidget(
                          title: AppString.nameModel,
                          content: drugInfoModel.name.toString(),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if( drugInfoModel.description.toString() != '') DrugInfoResultWidget(
                          title: AppString.descriptionModel,
                          content: drugInfoModel.description.toString(),

                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if( drugInfoModel.indication.toString() != '') DrugInfoResultWidget(
                          title: AppString.indicationModel,
                          content: drugInfoModel.indication.toString(),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if( drugInfoModel.foodInteractions.toString() != '') DrugInfoResultWidget(
                          title: AppString.foodInteractionsModel,
                          content: drugInfoModel.foodInteractions.toString(),

                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if( drugInfoModel.toxicity.toString() != '') DrugInfoResultWidget(
                          title: AppString.toxicityModel,
                          content: drugInfoModel.toxicity.toString(),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if( drugInfoModel.otherNames.toString() != '') DrugInfoResultWidget(
                          title: AppString.otherNamesModel,
                          content: drugInfoModel.otherNames.toString(),
                        ),

                      ],
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

class DrugInfoResultWidget extends StatelessWidget {
  const DrugInfoResultWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90.w,
          child: Text(
            '$title :',
            style: Theme.of(context).textTheme.bodySmall!.apply(
                fontSizeFactor: 1.sp, color: AppColors.dark, fontWeightDelta: 2),
          ),
        ),
        SizedBox(width: 3.w,),
        Expanded(
          child: Text(
            content,
            textAlign:TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.dark,

                fontWeightDelta: 1),
          ),
        ),
      ],
    );
  }
}
