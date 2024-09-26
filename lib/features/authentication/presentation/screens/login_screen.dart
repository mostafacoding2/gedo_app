import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/authentication/presentation/screens/caregiver_sign_up_screen.dart';
import 'package:alzcare/features/authentication/presentation/screens/patient_register_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/dont%20have%20account%20widget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/loginAndCurveWidget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.isPatient}) : super(key: key);
  final bool isPatient;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                  const LoginAndCurveWidget(text: "signIn to your account",textWidth: 155,),
                  Expanded(
                    flex: 4,
                    child: Transform.translate(
                      offset: Offset(0, -60.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.myWhite,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(60.r),
                          ),
                        ),
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.only(left: 24.r, right: 24.r),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 81.h,
                                ),
                                LoginForm(
                                  isPatient: widget.isPatient,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  formKey: formKey,
                                ),
                                SizedBox(
                                  height: 23.h,
                                ),
                                DontHaveAccountWidget(
                                  text1: "dontHaveAnAccount".tr(context),
                                  text2: "signUp".tr(context),
                                  onPressed: () {
                                    if (widget.isPatient) {
                                      navigateTo(
                                          context, const PatientSignUpScreen());
                                    } else {
                                      navigateTo(context,
                                          const CareGiverSignUpScreen());
                                    }
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


