import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/authentication/presentation/screens/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 13.w,
            height: 13.h,
            child: Checkbox(
                activeColor: AppColors.primaryColor,
                splashRadius: 0,
                value: AuthCubit.get(context).value,
                tristate: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                side: BorderSide(
                  color: AppColors.myGrey,
                  width: 1,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside
                ),
                onChanged: (value) {
                  AuthCubit.get(context).saveCreditInformation();
                }

// activeColor:
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 13.0.w),
            child: InkWell(
              radius: 0,
              onTap: ()
              {
                AuthCubit.get(context).saveCreditInformation();

              },
              child: Text(
                "rememberMe".tr(context),
                style: Theme.of(context).textTheme.displayMedium!.apply(
                      fontSizeFactor: 1.1.sp,
                      color: AppColors.dark,
                    ),
              ),
            ),
          ),
        ],
      );
  },
),
    );
  }
}

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key, required this.isPatient,
  });
  final bool isPatient;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            navigateTo(context,  ForgetPasswordScreen(isPatient: isPatient,));
          },
          child: Text(
            "forgotPassword".tr(context),
            style: Theme.of(context).textTheme.displayMedium!.apply(
                  fontSizeFactor: 1.1.sp,
                ),
          ),
        ),
      ],
    );
  }
}
