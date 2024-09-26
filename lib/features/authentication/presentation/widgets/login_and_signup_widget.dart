import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginAndSignUpWidget extends StatelessWidget {
  const LoginAndSignUpWidget({
    super.key,
    required this.text,
     this.secondText,
  });
  final String text;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text.tr(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.apply(
            fontSizeFactor: 1.1.sp,
          ),
        ),
        if(secondText != null)Text(
          secondText!.tr(context),
          style: Theme.of(context).textTheme.bodySmall!.apply(
                fontSizeFactor: 1.1.sp,
              ),
        ),
      ],
    );
  }
}

