import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickedImage extends StatelessWidget {
  const PickedImage({
    super.key,
    required this.onPressedCamera,
    required this.onPressedGallery,
  });

  final void Function()? onPressedCamera;
  final void Function()? onPressedGallery;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
        backgroundColor: AppColors.myWhite,
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(32.r)),
          height: 130.h,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: onPressedCamera,
                          icon:  Icon(
                            FontAwesomeIcons.camera,
                            size: 30.r,
                          ),
                          color: AppColors.primaryColor),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'الكاميرا',
                        textAlign: TextAlign.start,

                        style: Theme.of(context).textTheme.displayMedium!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.primaryColor,
                            ),
                      )
                    ],
                  ),
                   SizedBox(width: 50.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: onPressedGallery,
                          icon:  Icon(
                            Icons.photo,
                            size: 30.r,
                          ),
                          color: AppColors.primaryColor),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'المعرض',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayMedium!.apply(
                              fontSizeFactor: 1.1.sp,
                              color: AppColors.primaryColor,
                            ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),);
  }
}
