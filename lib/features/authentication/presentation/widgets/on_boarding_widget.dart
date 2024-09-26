import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/features/authentication/domain/entites/boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class onBoardingWidget extends StatelessWidget {
  const onBoardingWidget({
    super.key,
    required this.width,
    required this.index,
    required this.boarding,
    required this.boardController,
  });

  final double width;
  final int index;
  final List<BoardingModel> boarding;
  final PageController boardController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            width: 200.w,
            height: 180.h,
            boarding[index].image,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            boarding[index].body,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                fontSizeFactor: 1.1.sp,
              color: AppColors.dark,
                ),
          ),
        ],
      ),
    );
  }
}