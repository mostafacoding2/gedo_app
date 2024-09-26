import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/screens/direction_reading_books_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CameraReadingBooksScreen extends StatelessWidget {
  const CameraReadingBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  return  SafeArea(
        child:
        Scaffold(
      body: Column(children: [
        const CustomAppBarTextAndArrowWidget(
          iswhite: false,
          title: AppString.readingbooks,
          navigateToBottomNav: true,
          widgetnavigate: DirectionReadingBooksScreen(),
        ),
Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Stack(
      children: [
        Padding(
            padding: EdgeInsetsDirectional.only(top: 67.r,start: 24.r,end: 24.r),
            child: Container(height:640.h,width:327,decoration: BoxDecoration(borderRadius:BorderRadiusDirectional.circular(12.r),color:Color(0xffE0ECED)),)),
        Padding(
          padding:  EdgeInsets.only(top: 323.r,right: 128.r),
          child: SizedBox(
            height: 120.r,width: 120.w,
            child: SvgPicture.asset(ImagesPath.Camera),),
        ),

        Padding(
          padding:  EdgeInsets.only(top: 643.r,right: 40.r),
          child: Container(
            height: 40.h,width: 279.w,
            decoration: BoxDecoration(color: Color.fromRGBO(0, 100, 102, 0.4),borderRadius: BorderRadiusDirectional.circular(16)),
         child: Center(
           child: Row(children:
           [
             SizedBox(width: 16.5.w,),
             IconButton(onPressed: (){}, icon: Icon(Icons.minimize_outlined,color: AppColors.myWhite,size: 25,)),
           SizedBox(width: 100.w,),

             IconButton(onPressed: (){}, icon: Icon(Icons.add,color: AppColors.myWhite,size: 25,)),

             IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.searchengin,color: AppColors.myWhite,size: 25,))


           ],),
         ), )
        )

      ]
    ),
  ],
),
      ],),

    ));

  }
}
