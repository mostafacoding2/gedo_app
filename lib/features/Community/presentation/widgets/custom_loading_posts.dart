import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CustomloadingPost extends StatelessWidget {
  const CustomloadingPost({super.key, required this.length});
  final int length;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(16.r),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 44.w,
                            height: 8.h,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 44.w,
                            height: 8.h,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: SvgPicture.asset(ImagesPath.icons_sound),
                        )),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: SvgPicture.asset(ImagesPath.bi_x),
                        )),
                  ],
                ),
                SizedBox(height: 16.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 7.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 7.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 7.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 7.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                          width: 30.w, height: 5.h, color: AppColors.myWhite),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child:
                              const Icon(Icons.favorite, color: Colors.white),
                        )),
                    SizedBox(
                      width: 200.w,
                    ),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: SvgPicture.asset(ImagesPath.basil_comment))),
                  ],
                )
              ],
            ),
          );
        });
  }
}
