import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/authentication/presentation/screens/confirm_code_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
    required this.emailController,
    required this.formKey, required this.isPatient,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final bool isPatient;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 37.h,
        ),
        CustomTextFormField(
          controller: emailController,
          type: TextInputType.text,
          customSuffix: Padding(
            padding: EdgeInsetsDirectional.only(
                top: 12.0.h, bottom: 12.h, start: 10.w, end: 25.h),
            child: SvgPicture.asset(
              ImagesPath.emailIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
          hintText: "email".tr(context),
          obscureText: false,
          iconSize: 18.r,
          validator: (value) {
            String? error = emailValidation(value, context);
            return error;
          },
        ),
        SizedBox(
          height: 68.h,
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if(state is ForgetPasswordSuccessState)
              {
                flutterToast(message: AppString.forgetSuccessfullyMessage , success: true);
                navigateTo(context, ConfirmCodeScreen(
                    email: emailController.text,
                    isPatient: isPatient));
              }
              if(state is ForgetPasswordErrorState)
              {
                flutterToast(message: state.error , success: false);
              }
            },
            builder: (context, state) {
              return SizedBox(
                height: 48.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    if (formKey.currentState!.validate()) {
                      AuthCubit.get(context).forgetPassword(
                        email: emailController.text,
                      );
                    }
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: (state is ForgetPasswordLoadingState)
                      ? CircularProgressIndicator(
                    color: AppColors.myWhite,
                  )
                      : CustomElevatedButtonChild(
                    text: "sendCode".tr(context),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
