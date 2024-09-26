import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/shared%20_pref.dart';
import 'package:alzcare/features/authentication/presentation/screens/select_type_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/validation.dart';
import 'package:alzcare/features/profile/presentation/controller/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class changepasswordAccountsettingsScreen extends StatefulWidget {
  const changepasswordAccountsettingsScreen({super.key});

  @override
  State<changepasswordAccountsettingsScreen> createState() =>
      _changepasswordAccountsettingsScreenState();
}

class _changepasswordAccountsettingsScreenState
    extends State<changepasswordAccountsettingsScreen> {
  TextEditingController oldpasswordcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  Color color = AppColors.lightprimaryColor;
  bool isvisible = false;
  bool isvisible1 = false;
  bool isvisible2 = false;

  @override
  void dispose() {
    oldpasswordcontroller.dispose();
    newpasswordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('تغيير كلمة المرور',
                      style: lightTheme.textTheme.displayLarge!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.primaryColor,
                      )),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0.h),
                    child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.dark,
                            ))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 103.h,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        String? error = passwordValidation(value, context);
                        return error;
                      },
                      controller: oldpasswordcontroller,
                      customSuffix: Padding(
                        padding: EdgeInsets.only(left: 20.r),
                        child: IconButton(
                          icon: isvisible
                              ? Icon(
                            Icons.visibility_outlined,
                            color: AppColors.greyWithOP70,
                            size: 24,
                          )
                              : Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.greyWithOP70,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                        ),
                      ),
                      obscureText: isvisible,
                      type: TextInputType.text,
                      hintText: AppString.Oldpassword,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        String? error = passwordValidation(value, context);
                        return error;
                      },
                      controller: newpasswordcontroller,
                      customSuffix: Padding(
                        padding: EdgeInsets.only(left: 20.r),
                        child: IconButton(
                          icon: isvisible1
                              ? Icon(
                            Icons.visibility_outlined,
                            color: AppColors.greyWithOP70,
                            size: 24,
                          )
                              : Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.greyWithOP70,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              isvisible1 = !isvisible1;
                            });
                          },
                        ),
                      ),
                      obscureText: isvisible1,
                      type: TextInputType.text,
                      hintText: AppString.password,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        String? error = passwordValidation(value, context);
                        return error;
                      },
                      controller: confirmpasswordcontroller,
                      customSuffix: Padding(
                        padding: EdgeInsets.only(left: 20.r),
                        child: IconButton(
                          icon: isvisible2
                              ? Icon(
                            Icons.visibility_outlined,
                            color: AppColors.greyWithOP70,
                            size: 24,
                          )
                              : Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.greyWithOP70,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              isvisible2 = !isvisible2;
                            });
                          },
                        ),
                      ),
                      obscureText: isvisible2,
                      type: TextInputType.text,
                      hintText: AppString.Confirmpassword,
                    ),
                    SizedBox(
                      height: 98.h,
                    ),
                    BlocConsumer<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is ChangePasswordLoadingState) {
                          Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        } else if (state is ChangePasswordErrorState) {
                          flutterToast(message: state.error, success: false);
                        } else {
                          PreferenceUtils.removeData(SharedKeys.token);
                          PreferenceUtils.removeData(SharedKeys.userId);
                          PreferenceUtils.removeData(SharedKeys.userName);
                          navigateTo(context, SelectTypeUserScreen());
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:  AppColors.primaryColor),
                            onPressed: () {
                              if (newpasswordcontroller.text ==
                                  confirmpasswordcontroller.text) {
                                if (formKey.currentState!.validate()) {
                                  ProfileCubit.get(context).changePassword(
                                      oldPassword: oldpasswordcontroller.text,
                                      newPassword:
                                      newpasswordcontroller.text);
                                }
                              }
                            },
                            child: (state is ChangePasswordLoadingState)
                                ? CircularProgressIndicator(
                              color: AppColors.myWhite,
                            )
                                : CustomElevatedButtonChild(
                              text: "changing".tr(context),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
