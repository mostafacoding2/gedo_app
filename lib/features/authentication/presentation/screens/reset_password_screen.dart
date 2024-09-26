import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/authentication/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/component_in_general.dart';



class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.isPatient, required this.email, }) : super(key: key);
  final bool isPatient;
  final String email;


  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar:
        CustomAppBar(title: "createNewPassword".tr(context), context: context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 49.h,),

              SvgPicture.asset(ImagesPath.resetImage,width: 190.w,height: 190.h,),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 49.h,),
                    ResetPasswordForm(
                      confirmPasswordController: confirmPasswordController,
                      passwordController: passwordController,
                      formKey: formKey,
                      isPatient: widget.isPatient,
                      email: widget.email,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


