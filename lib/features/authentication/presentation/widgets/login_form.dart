import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/authentication/presentation/widgets/Remeber%20and%20forget%20password%20Widget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/validation.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.isPatient,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool isPatient;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomTextFormField(
          controller: emailController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(40),
          ],
          type: TextInputType.text,
          customSuffix: Padding(
            padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
            child: SvgPicture.asset(ImagesPath.emailIcon , width: 24.w, height: 24.h,),
          ),
          hintText: "email".tr(context),
          obscureText: false,
          validator: (value) {
            String? error =
            emailValidation(value, context);
            return error;
          },
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
                controller: passwordController,
                type: TextInputType.text,
                customSuffix: InkWell(
                    radius: 0,
                    onTap: (){cubit.changePasswordVisibility();} ,child: Padding(

                  padding: EdgeInsetsDirectional.only(top: 12.0.h,bottom: 12.h , start: 10.w ,end: 25.h),
                  child: SvgPicture.asset(cubit.suffix , width: 24.w,height: 24.h, ),
                )),
                hintText: "passwordLogin".tr(context),
                obscureText: cubit.isPassword,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(40),
                ],
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
          height: 16.h,
        ),
         Row(
          children: [
            const RememberMeWidget(),
            const Spacer(),
            ForgetPasswordWidget(isPatient: isPatient,),
          ],
        ),
        SizedBox(
          height: 130.h,
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>()..getToken(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context,state)
            {
              if(state is LoginSuccessState)
              {

                 flutterToast(message: AppString.loginSuccessfullyMessage , success: true);
                navigateAndRemove(context,  BottomNavScreen(currentIndex: null));
              }
              if(state is LoginErrorState)
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
                      AuthCubit.get(context).login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                    FocusManager.instance.primaryFocus
                        ?.unfocus();
                  },
                  child: (state is LoginLoadingState)
                      ? CircularProgressIndicator(
                    color: AppColors.myWhite,)
                      : CustomElevatedButtonChild(text: "signIn".tr(context),),),
              );
            },
          ),
        ),
      ],
    );
  }
}
