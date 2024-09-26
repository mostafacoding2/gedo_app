import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/authentication/presentation/screens/login_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/dont%20have%20account%20widget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/validation.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.confirmPasswordController,
     this.userCodeController,
    required this.formKey,
  });
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final TextEditingController? userCodeController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 56.h,
        ),
        CustomTextFormField(
          controller: userNameController,
          type: TextInputType.text,
          customSuffix: Padding(
            padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
            child: SvgPicture.asset(ImagesPath.userNameIcon , width: 24.w, height: 24.h,),
          ),
          hintText: "fullName".tr(context),
          obscureText: false,
          iconSize: 18.r,
          inputFormatters: [
            LengthLimitingTextInputFormatter(40),
          ],
          validator: (value) {
            String? error =
            userNameValidation(value, context);
            return error;
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextFormField(
          controller: emailController,
          type: TextInputType.text,
          inputFormatters: [
            LengthLimitingTextInputFormatter(40),
          ],
          customSuffix: Padding(
            padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
            child: SvgPicture.asset(ImagesPath.emailIcon , width: 24.w, height: 24.h,),
          ),
          hintText: "email".tr(context),
          obscureText: false,
          iconSize: 18.r,
          validator: (value) {
            String? error =
            emailValidation(value, context);
            return error;
          },
        ),
        // SizedBox(
        //   height: 16.h,
        // ),
        // CustomTextFormField(
        //   controller: phoneController,
        //   type: TextInputType.phone,
        //   inputFormatters: [
        //     FilteringTextInputFormatter.digitsOnly,
        //     LengthLimitingTextInputFormatter(11),
        //   ],
        //   customSuffix: Padding(
        //     padding: EdgeInsetsDirectional.only(top: 10.0.h,bottom: 10.h , start: 10.w ,end: 30.h),
        //     child: SvgPicture.asset(ImagesPath.phoneIcon , width: 15.w, height: 20.h,),
        //   ),
        //   hintText: "phone".tr(context),
        //   obscureText: false,
        //   iconSize: 18.r,
        //   validator: (value) {
        //     String? error =
        //     phoneInEgyptValidation(value, context);
        //     return error;
        //   },
        // ),
        SizedBox(
          height: 20.h,
        ),
        if(userCodeController != null)CustomTextFormField(
          controller: userCodeController,
          type: TextInputType.text,
          customSuffix: Padding(
            padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
            child: SvgPicture.asset(ImagesPath.codeIcon , width: 24.w, height: 24.h,),
          ),
          hintText: "userCode".tr(context),
          obscureText: false,

          iconSize: 18.r,
          inputFormatters: [
            LengthLimitingTextInputFormatter(8),
          ],
          validator: (value) {
            if(value!.isEmpty)
            {
              return "codeIsRequired".tr(context);
            }
          },
        ),
        if(userCodeController != null)SizedBox(
          height: 20.h,
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return CustomTextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(40),
                ],
                controller: passwordController,
                type: TextInputType.text,
                customSuffix: InkWell(
                    radius: 0,
                    onTap: (){cubit.changePasswordVisibility();} ,child: Padding(

                  padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
                  child: SvgPicture.asset(cubit.suffix , width: 24.w,height: 24.h, ),
                )),
                hintText: "password".tr(context),
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
          height: 20.h,
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return CustomTextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(40),
                ],
                controller: confirmPasswordController,
                type: TextInputType.text,
                customSuffix: InkWell(
                    radius: 0,
                    onTap: (){cubit.changePasswordVisibility();} ,child: Padding(

                  padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
                  child: SvgPicture.asset(cubit.suffix , width: 24.w,height: 24.h, ),
                )),
                hintText: "confirmPassword".tr(context),
                obscureText: cubit.isPassword,
                validator: (String? va) {
                  if (va!.isEmpty) {
                    return "passwordIsRequired".tr(context);
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    return "confirmPasswordValidation".tr(context);
                  }
                  return null;
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 46.h,
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>()..getToken(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context,state)
            {
              if(state is RegisterSuccessState)
              {
                flutterToast(message: AppString.registerSuccessfullyMessage , success: true);
                navigateTo(context, const LoginScreen(isPatient: true,));
              }
              if(state is RegisterErrorState)
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
                    if (formKey.currentState!
                        .validate()) {
                     if(userCodeController == null)
                     {
                       AuthCubit.get(context).patientRegister(
                         userName: userNameController.text,
                         email: emailController.text,
                         password: passwordController.text,
                       );
                     } else
                     {
                       AuthCubit.get(context).careGiverRegister(
                         userName: userNameController.text,
                         patientCode: userCodeController!.text,
                         email: emailController.text,
                         password: passwordController.text,
                       );
                     }
                    }
                    FocusManager.instance.primaryFocus
                        ?.unfocus();
                  },
                  child: (state is RegisterLoadingState)
                      ? CircularProgressIndicator(
                    color: AppColors.myWhite,)
                      : CustomElevatedButtonChild(text: "signUp".tr(context),),),
              );
            },
          ),
        ),
      ],
    );
  }
}
