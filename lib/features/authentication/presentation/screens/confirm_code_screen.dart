import 'dart:async';
import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/language%20cache%20helper.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/dont%20have%20account%20widget.dart';
import 'package:alzcare/features/authentication/presentation/widgets/pinput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class ConfirmCodeScreen extends StatefulWidget {
  ConfirmCodeScreen({Key? key, required this.email, required this.isPatient})
      : super(key: key);

  final String email;
  final bool isPatient;


  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  int remainingSeconds = 90;
  late Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    startCountdownTimer();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  void startCountdownTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  onResendButtonPressed(dynamic resendCode) {
    if (countdownTimer?.isActive ?? false) {
      // Timer is already running, do nothing.
    } else {
      print(widget.email);
      resendCode;
      setState(() {
        remainingSeconds = 90;
      });
      startCountdownTimer();
    }
  }

  String formatTime(int seconds) {
    if (seconds == 0) {
      return "resend".tr(context);
    } else {
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
    }
  }

  var formKey = GlobalKey<FormState>();
  String? code;
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final focusedBorderColor = Color(0xffE1E1E1);
  Color fillColor = AppColors.myWhite;
  final borderColor = Color(0xffE1E1E1);
  final defaultPinTheme = PinTheme(
    width: 46.w,
    height: 46.h,
    textStyle: GoogleFonts.alexandria(
      fontSize: 14.sp,
      color: AppColors.dark,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: Color(0xffE1E1E1), width: 1.5.w),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
        CustomAppBar(title: "resetPassword".tr(context), context: context),
        body: BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 80.h,
                ),
                Text(
                  "Enter the sent code".tr(context),
                  style: Theme.of(context).textTheme.displayLarge!.apply(
                        fontSizeFactor: 1.1.sp,
                    color: AppColors.dark,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "We have sent the confirmation code to".tr(context),
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                        fontSizeFactor: 1.2.sp,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(widget.email, style: Theme.of(context).textTheme.headlineMedium!.apply(
                        fontSizeFactor: 1.2.sp,
                      ),
                    ),
                  ],),
                SizedBox(
                  height: 45.h,
                ),
                PinInPutWidget(
                  formKey: formKey,
                  pinController: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  focusedBorderColor: focusedBorderColor,
                  fillColor: fillColor,
                ),
                SizedBox(
                  height: 40.h,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ResendCodeErrorState) {
                      flutterToast(message: state.error, success: false);
                    }
                  },
                  builder: (context, state) {
                    return DontHaveAccountWidget(
                        text1: "didn'tReceive".tr(context),
                        text2: formatTime(remainingSeconds),
                        onPressed: () {});
                  },
                ),
                SizedBox(
                  height: 153.h,
                ),

                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if(state is VerifyCodeSuccessState)
                    {
                      navigateTo(context, ResetPasswordScreen(isPatient: widget.isPatient,email: widget.email,));
                    }else if(state is VerifyCodeErrorState)
                    {
                      flutterToast(message: state.error, success: false);
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            print(code);
                            print(pinController.length == 4);
                            if (pinController.length == 4) {
                              AuthCubit.get(context).verifyCode( otp: pinController.text);
                            }
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: (state is VerifyCodeLoadingState)
                              ? CircularProgressIndicator(
                                  color: AppColors.myWhite,
                                )
                              : CustomElevatedButtonChild(
                                  text: "CodeVerification".tr(context))),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
