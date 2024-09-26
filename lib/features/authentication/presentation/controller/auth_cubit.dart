import 'dart:async';

import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/network/api_constant.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/dio_helper.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/core/utils/shared%20_pref.dart';
import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
import 'package:alzcare/features/authentication/domain/usecase/caregiver_register_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/forget_password_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/get_current_user_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/login_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/patient_register_use_case.dart';
import 'package:alzcare/features/authentication/domain/usecase/reset_password.dart';
import 'package:alzcare/features/authentication/domain/usecase/verify_code_use_case.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      this.getCurrentUserUseCase,
      this.patientRegisterUseCase,
      this.careGiverRegisterUseCase,
      this.loginUseCase,
      this.forgetPasswordUseCase,
      this.resetPasswordUseCase,
      this.verifyCodeUseCase,
  ) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  bool value = false;
  void saveCreditInformation() {
    value = !value;
    emit(SaveCreditDataState());
  }
  String suffix = ImagesPath.eyeIcon;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? ImagesPath.eyeIcon : ImagesPath.eyeSlashIcon;
    emit(ChangePasswordState());
  }

  String fcmToken = '';
  Future getToken() async {
    var fbm = FirebaseMessaging.instance;
    fbm.getToken().then((value)
    {
      fcmToken = value!;
    });
  }



  PatientRegisterUseCase patientRegisterUseCase;
  Future patientRegister({
    required String userName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    final result = await patientRegisterUseCase({
      'Uname': userName,
      'mail': email,
      'password': password,
    });
    result.fold((l) {
      emit(RegisterErrorState(l.message));
    }, (r)async {

      emit(RegisterSuccessState());

    });
  }
CareGiverRegisterUseCase careGiverRegisterUseCase;

  Future careGiverRegister({
    required String userName,
    required String email,
    required String patientCode,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    final result = await careGiverRegisterUseCase({
      'Uname': userName,
      'mail': email,
      'password': password,
      'patientCode': patientCode,
    });
    result.fold((l) {
      emit(RegisterErrorState(l.message));
    }, (r)async {

      emit(RegisterSuccessState());
    });
  }
  LoginUseCase loginUseCase;
  Future login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final result = await loginUseCase({
      'mail': email,
      'password': password,
    });
    result.fold((l) {
      emit(LoginErrorState(l.message));
    }, (r) async{
      PreferenceUtils.setString(SharedKeys.token, r.token!);
      PreferenceUtils.setString(SharedKeys.userType, r.data!.userType.toString());
      if(r.data!.userType == 1)
      {
        PreferenceUtils.setString(SharedKeys.patientCode, r.data!.patientCode!);
        patientCode = r.data!.patientCode!;
      }
    token = r.token!;
    userType = r.data!.userType.toString();
    final response =  await DioHelper.postData(url: ApiConstant.saveToken ,token: r.token, data: {
        "token":fcmToken,
      });
      emit(LoginSuccessState());
      PreferenceUtils.setString(SharedKeys.userId, r.data!.userId!);
      userId =  r.data!.userId!;
       PreferenceUtils.setString(SharedKeys.userName, r.data!.userName!);
      userName=r.data!.userName!;
    });
  }
  ForgetPasswordUseCase forgetPasswordUseCase;
  Future forgetPassword({
    required String email,
  }) async {
    emit(ForgetPasswordLoadingState());
    final result = await forgetPasswordUseCase(email);
    result.fold((l) {
      emit(ForgetPasswordErrorState(l.message));
    }, (r) {
      emit(ForgetPasswordSuccessState());
    });
  }
  VerifyCodeUseCase verifyCodeUseCase;
  Future verifyCode({
    required String otp,
  }) async {
    emit(VerifyCodeLoadingState());
    final result = await verifyCodeUseCase({
      'code': otp,
    });
    result.fold((l) {
      emit(VerifyCodeErrorState(l.message));
    }, (r) {
      userId =  r.userId!;
      emit(VerifyCodeSuccessState());
    });
  }
  ResetPasswordUseCase resetPasswordUseCase;
  Future resetPassword({
    required String newPassword,
  }) async {
    emit(ResetPasswordLoadingState());
    final result = await resetPasswordUseCase(ResetPasswordParameters(password: newPassword, userId: userId));
    result.fold((l) {
      emit(ResetPasswordErrorState(l.message));
    }, (r) {
      emit(ResetPasswordSuccessState());
    });
  }
  UserEntity ?userEntity;
  GetCurrentUserUseCase getCurrentUserUseCase;
  Future getCurrentUser() async {
    emit(GetCurrentUserLoadingState());
    final result = await getCurrentUserUseCase(const NoParameters());
    result.fold((l) {
      emit(GetCurrentUserErrorState(l.message));
    }, (r) {
      userEntity = r;
      emit(GetCurrentUserSuccessState(r));
    });
  }



}
