import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ItemPost extends StatelessWidget {
  const ItemPost({super.key, required this.name, this.ontapcomment, required this.numbercomments});
  final String name;
  final String numbercomments;
  final void Function()? ontapcomment;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.myWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color.fromRGBO(196, 222, 223, 1))),
      width: 327.w,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h, start: 16, end: 16),
            child: Row(
              children: [
                SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: SvgPicture.asset(ImagesPath.imageProfile)),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            fontSizeFactor: 1.1.sp,
                            color: AppColors.dark,
                          ),
                    ),
                    Text(
                      '2س',
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            fontSizeFactor: 1.1.sp,
                            color: AppColors.dark,
                          ),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(ImagesPath.icons_sound),
                ),
                SizedBox(
                  width: 8.w,
                ),
                SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(ImagesPath.bi_x),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 33.r, right: 16.r),
            child: Text(
              """ السلام عليكم كنت عايز أعرف دكتور عيون كويس
لأن عملت تسخيص على عيني في التطبيك و ظهر 
وجود مايه بيضه على العين """,
              style: Theme.of(context).textTheme.displayMedium!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.dark,
                  ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 23,
                      color: AppColors.myRedLight,
                    )),
                Text('12 أعجاب',
                    style: Theme.of(context).textTheme.headlineLarge!.apply(
                          fontSizeFactor: 1.1.sp,
                          color: AppColors.dark,
                        )),
                const Spacer(),
                Text(
                  numbercomments,
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                        fontSizeFactor: 1.1.sp,
                        color: AppColors.dark,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: 299.w,
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(196, 222, 223, 1)),
                borderRadius: BorderRadius.circular(1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.r),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border,
                        size: 25, color: AppColors.primaryColor)),
                const Spacer(),
                GestureDetector(
                    onTap: ontapcomment,
                    child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(ImagesPath.basil_comment)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
