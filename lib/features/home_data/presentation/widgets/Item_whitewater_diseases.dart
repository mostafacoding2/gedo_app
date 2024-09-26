import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
class ItemWhiteWaterDiseases extends StatelessWidget {
  const ItemWhiteWaterDiseases({super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 16.r),
      width: double.infinity.w,decoration: BoxDecoration(
        color:AppColors.myWhite,borderRadius: BorderRadiusDirectional.circular(8.r),
        boxShadow: [BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 4,spreadRadius: 0,
            color: Color.fromRGBO(191, 214, 215, 0.6))]

    ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 16.w,),

          Column(
            children: [
              SizedBox(height: 16.h,),

              Text('22/5/2023',style: lightTheme.textTheme.headlineMedium!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.dark,
              ),),
              SvgPicture.asset(width:64.w,height:64.h,ImagesPath.FormAnalysis ),
            ],
          ),


          Padding(
            padding: EdgeInsetsDirectional.only(start: 12.w,top: 45.r),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Text('الماء البيضة',style: lightTheme.textTheme.displayMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.dark,
                ),),
//
                Text('مصاب',style: lightTheme.textTheme.displayMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.dark,
                ),),
                Padding(
                  padding:  EdgeInsets.only(top:16.r,right: 200),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color:Color(0xffA4AAAB),size: 30,)),
                )

              ],),
          ),


        ],),

    );
  }
}