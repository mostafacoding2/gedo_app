import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/home_data/presentation/screens/direction_audioreading_screen.dart';
import 'package:alzcare/features/home_data/presentation/screens/view_content_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AudioReadingScreen extends StatelessWidget {
  const AudioReadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return  SafeArea(
        child: Scaffold(body:
        Column(
            children: [
              const CustomAppBarTextAndArrowWidget(
                iswhite: false,
                title: AppString.viewContent,
                navigateToBottomNav: true,
                widgetnavigate:ViewContentScreen(),
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24.r),
                  child: Column(children: [
                    Stack(
                      children:
                      [
                        PositionedDirectional(top:165.r,
                            child: SizedBox( width:170.w,height:190.h,child: SvgPicture.asset(ImagesPath.Reboot),)),
                        PositionedDirectional(top:85.r ,start: 153.r  ,child: SizedBox( width:180.w,height:210.h,child: SvgPicture.asset(ImagesPath.cloudy))),
                        PositionedDirectional(top:139.h,
                          start: 181.r,
                          child: Text(
                              """  أنا روبوت ذكاء إصطناعي 
تم إنشاؤه لقراءة الاشياء 
و أخراجها صوتاً و أيضاً
يساعدك في تكبير
الأشياء المكتوبه 
لرؤيتها بطريقه
واضحه """
                              ,textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineLarge!.apply(
                                fontSizeFactor: 1.1.sp,
                                color: AppColors.dark,
                              )),
                        ),

                        PositionedDirectional(top:387.h,
                          start: 48.r,end: 27.w,
                          child: Text(
                            """سوف يساعدك في تلقي الاشياء المكتوبة 
على هيئة صوت بالذكاء الاصطناعي و أيضاً
توضيح و تكبير الخطوط """
                              ,textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineLarge!.apply(
                                fontSizeFactor: 1.1.sp,
                                color: AppColors.dark,
                              )),
                        ),
                        Padding(padding: EdgeInsetsDirectional.only(top: 507.h,),
                          child: CustomButton(
                            text: "next",
                            onPressed: () {navigateAndRemove(context, const DirectionsAudioReadingScreen());},
                          ),
                        ),

                      ],
                    ),
                  ],),
                ),
              )

            ])));  }
}
