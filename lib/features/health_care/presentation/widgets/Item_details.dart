import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextItem extends StatelessWidget {
  const TextItem(
      {super.key, required this.title, required this.content, this.content2});

  final String title;
  final String content;
  final String? content2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: lightTheme.textTheme.headlineMedium!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width:180.w,
          child: Text(
            maxLines: 4,
            (content2 == null)
                ? content
                : '[$content  , $content2]',
            style: lightTheme.textTheme.headlineMedium!.apply(
              fontSizeFactor: 1.sp,
              color: AppColors.dark,
            ),
          ),
        ),
      ],
    );
  }
}
