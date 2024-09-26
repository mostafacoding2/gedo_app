import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Ietmselectedfont extends StatefulWidget {
  const   Ietmselectedfont({super.key,});

  @override
  State<Ietmselectedfont> createState() => _ItemfontState();
}

class _ItemfontState extends State<Ietmselectedfont> {
  int selectedIndex=0;


  @override
  Widget build(BuildContext context,) {
    return
      Container(
          height: 290.h,
          width: 375.w,decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(16)),
          
          child: Column(
              children: [
                SizedBox(height: 8.h,),
                Container(width: 45.w,height: 5.h,decoration: BoxDecoration(color: Color.fromRGBO(235, 237, 237, 1),borderRadius: BorderRadiusDirectional.circular(2.5.r)),
                )  ,
                SizedBox(height: 8.h,),
                Text('تغير حجم الخط ',style: lightTheme.textTheme.labelMedium!.apply(
                  fontSizeFactor: 1.sp,
                  color: AppColors.primaryColor,
                ),),
                ListBody(children: [
                  SizedBox(height: 8.h,),
                  buildChoiceTile(0, 'كبير'),
                  SizedBox(height: 14.h,),
                  buildChoiceTile(1, 'متوسط'),
                  SizedBox(height: 14.h,),
                  buildChoiceTile(2, 'صغير'),
                  SizedBox(height: 11.h,),
                  buildChoiceTile(3, 'افتراضي'),





                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 249.r,top:31.h,bottom: 20.h),
                    child: Row(children:
                    [
                      InkWell(onTap: ()
                      {
                        Navigator.of(context).pop(true);                             },
                        child: Text(AppString.sure,style: lightTheme.textTheme.labelMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        )),
                      ),
                      SizedBox(width: 40,),
                      InkWell(onTap: ()
                      {
                        Navigator.of(context).pop(false);                             },
                        child: Text(AppString.cancel,style: lightTheme.textTheme.labelMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        )),
                      ),
                    ],),
                  ),
                  SizedBox(height: 22.h,),
                ],)]));}
  Widget buildChoiceTile( int index, String title) {

    bool isSelected = selectedIndex == index;
    return Row(
      children: [
        SizedBox(width: 33.w,),
        GestureDetector( onTap:(){
          setState(() {
            selectedIndex = index;
          });
        },child: Container(width: 16.w,height: 16.h,decoration: BoxDecoration(color: isSelected?AppColors.primaryColor:AppColors.myWhite,borderRadius: BorderRadiusDirectional.circular(360),border: Border.all(color: AppColors.primaryColor)),)),
        SizedBox(width: 18.w,),
        Text(title,style: lightTheme.textTheme.bodySmall!.apply(
          fontSizeFactor: 1.sp,
          color: AppColors.dark,
        ),),  ],);}
}
