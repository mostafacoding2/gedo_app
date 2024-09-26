import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/health_care/presentation/screens/read_medicine_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/directions_readmedicine_body.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DirectionsReadingMedicineScreen extends StatelessWidget {
  const DirectionsReadingMedicineScreen({super.key});
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
        widgetnavigate:ReadMedicineScreen(),
        ),
            SizedBox(height: 58.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.r),
              child:const  DirectionsReadMedicineBody()
            ),
          ],)
        ));
  }
}
