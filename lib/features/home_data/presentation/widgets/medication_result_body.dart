import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class MedicationResultBody extends StatelessWidget {
  const MedicationResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return       Expanded(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 24.r),
            child: Column(
                children: [
                  Container(
                    width: 327.w,height: 250.h,
                    margin: EdgeInsetsDirectional.only(top:48.r),
                    decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.all(Radius.circular(16))),
                    child: SvgPicture.asset(ImagesPath.dataalanysis),)

                  ,SizedBox(height: 24.h,)

                  , Text('أسم الدواء',style: Theme.of(context).textTheme.displayLarge!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.primaryColor,
                  )),
                  SizedBox(height: 16.h,),

                  Container(width: 301,height: 2,color: Color.fromRGBO(235, 237, 237, 1),),
                  SizedBox(height: 12.h,),

                  Text("""هذا الدواء لا يناسبك لانه سوف يتسبب
 في أضرار جانبيه مع انتريستو عليك 
الذهاب الي الطبيب لمعرفته""",style: Theme.of(context).textTheme.displayMedium!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.primaryColor,
                  ),textAlign: TextAlign.center,),


                ]

            ),),       GestureDetector(
            onTap: (){},
            child: Container(
              margin:
              EdgeInsetsDirectional.only(top: 485.r, start: 295.r,bottom: 25.r),
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadiusDirectional.circular(360),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0,4),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Color.fromRGBO(225, 225, 225, 1))
                  ]),
              child: Icon(
                Icons.volume_down_sharp,
                color: AppColors.myWhite,
                size: 30,
              ),
            ),
          ),

          CustomBottomCurvyCircles()
        ],
      ),
    )
    ;
  }
}
