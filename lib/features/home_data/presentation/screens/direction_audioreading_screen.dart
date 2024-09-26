import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/home_data/presentation/screens/audio_reading_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/directions_audioreading_body.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DirectionsAudioReadingScreen extends StatelessWidget {
  const DirectionsAudioReadingScreen({super.key});
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
        child: Scaffold(body: Column(
          children: [
            const CustomAppBarTextAndArrowWidget(
              iswhite: false,
              title: AppString.instructions,
              navigateToBottomNav: true,
              widgetnavigate:AudioReadingScreen(),
            ),
            SizedBox(height: 58.h,),
            DirectionsAudioreadingBody()
          ],)
        ));
  }
}
