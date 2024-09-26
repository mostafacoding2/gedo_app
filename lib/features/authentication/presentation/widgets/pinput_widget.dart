import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/app_color.dart';


class PinInPutWidget extends StatelessWidget {
  const PinInPutWidget({
    super.key,
    required this.formKey,
    required this.pinController,
    required this.focusNode,
    required this.defaultPinTheme,
    required this.focusedBorderColor,
    required this.fillColor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController pinController;
  final FocusNode focusNode;
  final PinTheme defaultPinTheme;
  final Color focusedBorderColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            controller: pinController,
            length: 4,
            focusNode: focusNode,
            androidSmsAutofillMethod:
            AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) =>  SizedBox(width: 12.w),
            validator: (value) {
            },
            // onClipboardFound: (value) {
            //   debugPrint('onClipboardFound: $value');
            //   pinController.setText(value);
            // },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.primaryColor ,width: 1.5.w),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: focusedBorderColor,width: 1.5.w),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
        ),
      ),
    );
  }
}