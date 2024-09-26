import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.borderRadius = 16,
    this.width = double.infinity,
    this.containerColor = const Color(0xff006466),
    required this.onPressed,
    required this.text,
    this.colorIsWhite = false,
  });
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? containerColor;
  final void Function() onPressed;
  final String text;
  final bool? colorIsWhite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height!.h,
        width: width,
        decoration: BoxDecoration(
          border:colorIsWhite! ? Border.all(
            color: AppColors.primaryColor.withOpacity(0.25),
          ) : null,
          boxShadow:colorIsWhite! ?  const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 100, 102, 0.25),
            ),
          ] : null,
          borderRadius: BorderRadius.circular(borderRadius!.r),
          color: colorIsWhite! ? AppColors.myWhite: containerColor,
        ),
        child: CustomElevatedButtonChild(text: text.tr(context),colorIsWhite: colorIsWhite,),
      ),
    );
  }
}
