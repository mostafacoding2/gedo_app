part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class SaveCreditDataState extends AuthState {}

class ChangePasswordState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {

}

class LoginErrorState extends AuthState {
  final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;

  RegisterErrorState(this.error);
}

class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {}

class ForgetPasswordErrorState extends AuthState {
  final String error;

  ForgetPasswordErrorState(this.error);
}
class ResendCodeLoadingState extends AuthState {}

class ResendCodeSuccessState extends AuthState {}

class ResendCodeErrorState extends AuthState {
  final String error;

  ResendCodeErrorState(this.error);
}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String error;

  ResetPasswordErrorState(this.error);
}



class LogOutLoadingState extends AuthState {}

class LogOutSuccessState extends AuthState {}

class LogOutErrorState extends AuthState {
  final String error;

  LogOutErrorState(this.error);
}


class VerifyCodeLoadingState extends AuthState {}

class VerifyCodeSuccessState extends AuthState {}

class VerifyCodeErrorState extends AuthState {
  final String error;

  VerifyCodeErrorState(this.error);
}

class LoginWithGoogleLoadingState extends AuthState {}
class LoginWithGoogleSuccessState extends AuthState {}
class LoginWithGoogleErrorState extends AuthState
{
  final String error;

  LoginWithGoogleErrorState(this.error);
}

class LoginWithSocialLoadingState extends AuthState {}
class LoginWithSocialSuccessState extends AuthState {}
class LoginWithSocialErrorState extends AuthState
{
  final String error;

  LoginWithSocialErrorState(this.error);
}
class GetCurrentUserLoadingState extends AuthState {}
class GetCurrentUserSuccessState extends AuthState {
  UserEntity userEntity;
  GetCurrentUserSuccessState(this.userEntity);
}
class GetCurrentUserErrorState extends AuthState
{
  final String error;

  GetCurrentUserErrorState(this.error);
}