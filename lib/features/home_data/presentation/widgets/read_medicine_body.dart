import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:alzcare/features/home_data/presentation/screens/directions_readingmedicine_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ReadMedicineBody extends StatelessWidget {
  const ReadMedicineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.r),
        child: Column(children: [
          Stack(
            children:
            [
              PositionedDirectional(top:165.r,
                  child: SizedBox( width:170.w,height:190.h,child: SvgPicture.asset(ImagesPath.Reboot),)),
              PositionedDirectional(top:117.r ,start: 147.r  ,child: SizedBox( width:180.w,height:160.h,child: SvgPicture.asset(ImagesPath.cloudy))),
              PositionedDirectional(top:163.h,
                start: 179.r,
                child: Text(
                    """أنا روبوت ذكاء إصطناعي
تم إنشاؤه لقراءة الدواء
و معرفة إذا كان مناسب
ام يسبب لك أضرار"""
                    ,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.apply(
                      fontSizeFactor: 1.1.sp,
                      color: AppColors.dark,
                    )),
              ),

              PositionedDirectional(top:387.h,
                start: 48.r,end: 27.w,
                child: Text(
                    """سوف يساعدك في مقرنة اسم الدواء و مقارنتها مع الدواء الذى تأخذها بأستمرار
            """
                    ,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.apply(
                      fontSizeFactor: 1.1.sp,
                      color: AppColors.dark,
                    )),
              ),
              Padding(padding: EdgeInsetsDirectional.only(top: 507.h,),
                child: CustomButton(
                  text: "next",
                  onPressed: () {navigateAndRemove(context, DirectionsReadingMedicineScreen());},
                ),
              ),

            ],
          ),


        ],),
      ),
    );
  }
}
