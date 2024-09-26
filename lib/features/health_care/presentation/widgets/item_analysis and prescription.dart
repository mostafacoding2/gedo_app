import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class ItemAnalysisPrescription extends StatelessWidget {
  const ItemAnalysisPrescription(
      {super.key,
      required this.title,
      required this.content,
      required this.onTap,
      required this.urlImage,
      required this.date,
       this.textWeight,
      required this.deleteClick});

  final String title;
  final String content;
  final String urlImage;
  final String date;
  final double? textWeight;
  final void Function()? onTap;
  final void Function()? deleteClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 16.r),
        width: double.infinity.w,
        padding: EdgeInsetsDirectional.only(
            bottom: 12.h, top: 16.h, start: 16.w, end: 16.w),
        decoration: BoxDecoration(
            color: AppColors.myWhite,
            borderRadius: BorderRadiusDirectional.circular(8.r),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Color.fromRGBO(191, 214, 215, 0.6))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 64.w,
                    height: 49.h,
                    child: (urlImage == '')
                        ? null
                        : CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: urlImage,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: AppColors.myRedLight),
                          )),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppString.date} :',
                        style: lightTheme.textTheme.headlineMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      SizedBox(
                        width: 170.w,
                        child: Text(
                          date.split('T').first,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: lightTheme.textTheme.headlineMedium!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.dark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title:',
                        style: lightTheme.textTheme.headlineMedium!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      SizedBox(
                        width: textWeight != null ? textWeight!.w:140.w,
                        child: Text(
                          content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: lightTheme.textTheme.headlineMedium!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.dark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: IconButton(
                onPressed: deleteClick,
                icon: const Icon(
                  Icons.delete,
                  color: Color(0xffA4AAAB),
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
