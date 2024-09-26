import 'package:flutter/material.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyMessage extends StatelessWidget {
  const MyMessage(
      {super.key,
      required this.text,
      required this.time,
      required this.urlimage,
      required this.urlimagechat});

  final String text;
  final String time;
  final String urlimage;
  final String urlimagechat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (text.isEmpty && urlimagechat.isNotEmpty)
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(360.r),
                child: SizedBox(
                    width: 32.w,
                    height: 32.h,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: urlimage,
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
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h),
                    child: SizedBox(
                        width: 200.w,
                        height: 200.h,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: urlimagechat,
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
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    time,
                    style: lightTheme.textTheme.headlineLarge!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.dark,
                    ),
                  ),
                ],
              ),
            ],
          )
        else if (text.isNotEmpty && urlimagechat.isNotEmpty)
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(360.r),
                child: SizedBox(
                    width: 32.w,
                    height: 32.h,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: urlimage,
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
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h),
                    child: SizedBox(
                        width: 200.w,
                        height: 200.h,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: urlimagechat,
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
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ChatBubble(
                    clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 20),
                    backGroundColor: AppColors.primaryColor,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        text,
                        style: lightTheme.textTheme.labelSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    time,
                    style: lightTheme.textTheme.headlineLarge!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.dark,
                    ),
                  ),
                ],
              ),
            ],
          )
        else if (text.isNotEmpty)
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(360.r),
                child: SizedBox(
                    width: 32.w,
                    height: 32.h,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: urlimage,
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
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatBubble(
                    clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 20.h),
                    backGroundColor: AppColors.primaryColor,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        text,
                        style: lightTheme.textTheme.labelSmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myWhite,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    time,
                    style: lightTheme.textTheme.headlineLarge!.apply(
                      fontSizeFactor: 1.sp,
                      color: AppColors.dark,
                    ),
                  ),
                ],
              )
            ],
          ),
        if (text.isEmpty) const SizedBox()
      ],
    );
  }
}
