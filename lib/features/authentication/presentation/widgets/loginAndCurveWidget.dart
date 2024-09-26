import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/features/authentication/presentation/widgets/login_and_signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginAndCurveWidget extends StatelessWidget {
  const LoginAndCurveWidget({
    super.key, required this.text, this.textWidth ,
  });

  final String text;
  final double? textWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Stack(
              children: [
                PositionedDirectional(
                  bottom: 60.h,
                  end: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.myWhite,
                      border: BorderDirectional(
                        top: BorderSide(
                          color: AppColors.primaryColor,
                          width: 0,
                        ),
                        bottom: BorderSide(
                          color: AppColors.primaryColor,
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        start: BorderSide(
                          color: AppColors.primaryColor,
                          width: 0,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 50.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        border: Border.all(
                          width: 0,
                          strokeAlign: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius:
                        BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(40.r),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 90.h,),
                      SizedBox(
                        width:  textWidth == null? null:textWidth!.w,
                        child:  LoginAndSignUpWidget(
                          text: text,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
