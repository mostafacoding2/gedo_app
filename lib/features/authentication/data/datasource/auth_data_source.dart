import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/network/api_constant.dart';
import 'package:alzcare/core/network/error_message_model.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/dio_helper.dart';
import 'package:alzcare/features/authentication/data/model/user%20data%20model.dart';
import 'package:alzcare/features/authentication/domain/usecase/reset_password.dart';
import 'package:dio/dio.dart';
abstract class AuthBaseRemoteDataSource {
  Future patientRegister(Map<String, dynamic> parameters);
  Future careGiverRegister(Map<String, dynamic> parameters);
  Future<UserModel> login(Map<String, dynamic> parameters);
  Future<UserModel> forgetPassword(String email);
    Future<UserModel> resetPassword(      ResetPasswordParameters resetPasswordParameters);
  Future<UserModel> verifyCode(Map<String, dynamic> parameters);
  Future<UserModel>getCurrentUser();
}
class AuthRemoteDataSource extends AuthBaseRemoteDataSource {
  @override
  Future patientRegister(Map<String, dynamic> parameters) async {
    try {
      final response = await DioHelper.postData(
          url: ApiConstant.patientSignUp, data: parameters);
    } on DioException catch (error)
    {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future careGiverRegister(Map<String, dynamic> parameters) async {
    try {
      final response = await DioHelper.postData(
          url: ApiConstant.careGiverSignUp, data: parameters);

    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<UserModel> login(Map<String, dynamic> parameters) async {
    try {
      final response =
          await DioHelper.postData(url: ApiConstant.login, data: parameters);
      return UserModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<UserModel> forgetPassword(String email) async {
    try {
      final response =
          await DioHelper.postData(url: ApiConstant.forgetPassword, data: {
        'mail': email,
      });
      return UserModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<UserModel> verifyCode(Map<String, dynamic> parameters) async {
    try {
      final response = await DioHelper.postData(
          url: ApiConstant.verifyCode, data: parameters);
      return UserModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<UserModel> resetPassword(
      ResetPasswordParameters resetPasswordParameters) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConstant.resetPassword(resetPasswordParameters.userId),
        data: {'password': resetPasswordParameters.password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await DioHelper.postData(
        token: token,
        url: ApiConstant.getcurrentuser,
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data)
      );
    }
  }
}
