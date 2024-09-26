import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/authentication/presentation/screens/login_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/dont%20have%20account%20widget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/loginAndCurveWidget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/login_and_signup_widget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PatientSignUpScreen extends StatefulWidget {
  const PatientSignUpScreen({Key? key}) : super(key: key);

  @override
  State<PatientSignUpScreen> createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LoginAndCurveWidget(text: "CreateUserAccount",),
                  Expanded(
                    flex: 4,
                    child: Transform.translate(
                      offset: Offset(0, -60.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.myWhite,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(35.r),
                          ),
                        ),
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.only(left: 24.r, right: 24.r),
                            child: Column(
                              children: [
                                SignUpForm(
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  phoneController: phoneController,
                                  formKey: formKey,
                                  userNameController: userNameController,
                                  confirmPasswordController: confirmPasswordController,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                DontHaveAccountWidget(
                                  text1: "alreadyHaveAnAccount".tr(context),
                                  text2: "signIn".tr(context),
                                  onPressed: () {
                                    navigateTo(context, const LoginScreen(isPatient: true,));
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

