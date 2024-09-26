import 'package:alzcare/features/home_data/presentation/screens/direction_diagnosis_skin%20desies_diseases_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/diseases_screen.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/services.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagnosisDiseasesSkinDesiesScreen extends StatelessWidget {
  const DiagnosisDiseasesSkinDesiesScreen({super.key, required this.modelName});
  final String modelName;

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
            body: Column(children: [
      const CustomAppBarTextAndArrowWidget(
        iswhite: false,
        title: AppString.diagnosesDiseases,
        navigateToBottomNav: true,
        widgetnavigate: DiseasesScreen(),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 50.h),

                    child: SvgPicture.asset(ImagesPath.diagnosisImage,width: double.infinity * .8,
                      height: 250.h,),
                  ),
                  PositionedDirectional(
                    top: 387.h,
                    start: 48.r,
                    end: 27.w,
                    child: Text("""ليس من المفترض إستبدال طبيبك ولا أقدم أي 
ضمانات لدقة نتائجي يرجى التواصل مع طبيبك 
للحصول على تسخيصات و نتائج دقيقه""",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.dark,
                            )),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 507.h,
                    ),
                    child: CustomButton(
                      text: "next",
                      onPressed: () {
                        navigateTo(context,
                             DirectionDiagnosisSkinDesiesDiseasesScreen(modelName: modelName,));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ])));
  }
}
