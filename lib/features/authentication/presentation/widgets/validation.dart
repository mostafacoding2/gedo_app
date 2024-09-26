
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:flutter/cupertino.dart';

String? passwordValidation(String? va ,  BuildContext context) {
  RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
  if (va!.isEmpty) {
    return 'passwordIsRequired'.tr(context);
  }if (va.length < 6) {
    return "passwordIsShort".tr(context);
  } else if (!regex.hasMatch(va)) {
    return ("passwordFormat".tr(context));
  }
  return null;
}

String? emailValidation(va, BuildContext context) {
  if (va!.isEmpty) {
    return "emailIsRequired".tr(context);
  }
  final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(va);
  if (emailValid != true) {
    return "emailFormat".tr(context);
  }
  return null;
}

String? userNameValidation(va , BuildContext context) {
  if (va!.isEmpty) {
    return "userNameIsRequired".tr(context);
  }
  if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(va)) {
    return "userNameFormat".tr(context);
  }
  return null;
}

String? phoneInEgyptValidation(va, BuildContext context) {
  if (va!.isEmpty) {
    return "phoneIsRequired".tr(context);
  }
  final bool emailValid = va  == 11;
  if (emailValid != true) {
    return "phoneFormat".tr(context);
  }
  return null;
}
