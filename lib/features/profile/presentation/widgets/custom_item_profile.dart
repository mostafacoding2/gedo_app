import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
    this.isLogOut = false,
    this.isCode = false,
  });

  final String image;
  final void Function() onPressed;
  final String title;
  final bool isLogOut;
  final bool isCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 5.r, bottom: 16.r),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 24.h,
              width: 24.w,
              color: !isLogOut ? AppColors.primaryColor : AppColors.myRedLight,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.dark,
                  ),
            ),
            const Spacer(),
            if (!isLogOut && !isCode)
              const Icon(
                Icons.arrow_forward_ios,
                size: 25,
              ),
            if (isCode)
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: patientCode)).then((value) => flutterToast(message: AppString.copySuccessfully, success: true));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.copy_outlined,
                      size: 18.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      patientCode,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.apply(
                            fontSizeFactor: 1.1.sp,
                            color: AppColors.dark,
                          ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
