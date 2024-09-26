import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/authentication/presentation/screens/after_reset_password_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/Remeber%20and%20forget%20password%20Widget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
    required this.formKey, required this.isPatient, required this.email,
  });
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final bool isPatient;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return CustomTextFormField(
                controller: passwordController,
                type: TextInputType.text,
                customSuffix: InkWell(
                    radius: 0,
                    onTap: (){cubit.changePasswordVisibility();} ,child: Padding(

                  padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
                  child: SvgPicture.asset(cubit.suffix , width: 24.w,height: 24.h, ),
                )),
                hintText: "newPassword".tr(context),
                obscureText: cubit.isPassword,
                validator: (value) {
                  String? error =
                  passwordValidation(value, context);
                  return error;
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 36.h,
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return CustomTextFormField(
                controller: confirmPasswordController,
                type: TextInputType.text,
                customSuffix: InkWell(
                    radius: 0,
                    onTap: (){cubit.changePasswordVisibility();} ,child: Padding(

                  padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
                  child: SvgPicture.asset(cubit.suffix , width: 24.w,height: 24.h, ),
                )),
                hintText: "confirmNewPassword".tr(context),
                obscureText: cubit.isPassword,
                validator: (String? va) {
                  if (va!.isEmpty) {
                    return "passwordIsRequired".tr(context);
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    return "confirmPasswordValidation".tr(context);
                  }
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 100.h,
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context,state)
            {
              if(state is RegisterSuccessState)
              {
                navigateAndRemove(context, AfterResetPasswordScreen(isPatient: isPatient));
              }
              if(state is RegisterErrorState)
              {
                flutterToast(message: state.error , success: false);
              }
            },
            builder: (context, state) {
              return SizedBox(
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!
                        .validate()) {
                      AuthCubit.get(context).resetPassword(
                        newPassword: passwordController.text,
                      );
                    }
                    FocusManager.instance.primaryFocus
                        ?.unfocus();
                  },
                  child: (state is LoginLoadingState)
                      ? CircularProgressIndicator(
                    color: AppColors.dark,)
                      : CustomElevatedButtonChild(text: "sure".tr(context),),),
              );
            },
          ),
        ),
      ],
    );
  }
}
