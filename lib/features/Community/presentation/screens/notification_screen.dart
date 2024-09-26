import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_appBar_notification_community.dart';
import 'package:alzcare/features/Community/presentation/widgets/notification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffB2D1D1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    );
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarNotificationCommunity(widget: Text('الإشعارات',
              style: lightTheme.textTheme.labelLarge!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.dark,
              )),),
        const  NotificationBody(),
        ],
      ),
    );
  }
}
