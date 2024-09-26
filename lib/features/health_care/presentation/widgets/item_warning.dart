import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ItemMessage extends StatelessWidget {
  const   ItemMessage({super.key,required  this.title});
final  String title;
  @override
  Widget build(BuildContext context,) {
    return
      AlertDialog(
                  backgroundColor: AppColors.myWhite,
                  content:Container(
                    height: 200.h,
                    width: 327.w,
                    child: Column(
                      children: [
                        Text(AppString.warning,style: lightTheme.textTheme.labelMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),),
                        SizedBox(height: 53.h,),
                        Text(title,
                          style: lightTheme.textTheme.displaySmall!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.dark,
                          ),),
                        SizedBox(height: 52.h,),

                        Row(children:
                        [const Spacer(),
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
                          SizedBox(width: 24.h,),

                        ],),
                        SizedBox(height: 22.h,),
                      ],),
                  )
              ) ;}



}
