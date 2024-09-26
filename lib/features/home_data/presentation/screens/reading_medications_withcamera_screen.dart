import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/screens/directions_readingmedicine_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/medication_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ReadingMedicationsWithcameraScreen extends StatelessWidget {
  const ReadingMedicationsWithcameraScreen({super.key});
  @override
  Widget build(BuildContext context) {   SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.myWhite,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
    return  SafeArea(
      child: Scaffold(
        body: Column(children: [
          Stack(
            children: [
              Container(width: 375.w,height: 475.h,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(178, 209, 209, 1),
                borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(16.r),
                    bottomStart:Radius.circular(16)
                )),),
              PositionedDirectional(top:32.r, end:32.r,start:319.w,child: Container(
                child: IconButton(icon: Icon(size:32,Icons.cancel,color: AppColors.primaryColor,),
                  onPressed: (){navigateTo(context, DirectionsReadingMedicineScreen());},),))
      
            ],
          ),
          Row(children: [
             GestureDetector(onTap:(){},child: Padding( padding:EdgeInsetsDirectional.only(top:127.r,start: 55.r),child: SvgPicture.asset(width:35.w,height:35.h,ImagesPath.Return),)),
            GestureDetector(onTap: (){ navigateAndRemove(context, MedicationResultScreen());},child: Padding(padding:EdgeInsetsDirectional.only(top:97.r,start: 50.r),child: SvgPicture.asset(width:95.w,height:95.h,ImagesPath.Shotcamera),)),
            GestureDetector( onTap:(){},child: Padding(padding:EdgeInsetsDirectional.only(top:127.r,start: 50.r),child: SvgPicture.asset(width:35.h,height:35.h,ImagesPath.addimage),)),
          ],)
        ],),
      ),
    );
  }
}
