 import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/network/api_constant.dart';
import 'package:alzcare/core/network/error_message_model.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/dio_helper.dart';
import 'package:alzcare/features/profile/data/model/Profile%20model.dart';
import 'package:dio/dio.dart';
abstract class BaseProfileRemoteDataSource
{
  Future<ProfileModel>changeProfileImage( FormData formData);
  Future<ProfileModel>changePassword(Map<String,dynamic> body);
}
class ProfileRemoteDataSource extends BaseProfileRemoteDataSource{
  @override
  Future<ProfileModel> changeProfileImage(FormData formData)async {
    try {
      final response = await DioHelper.putData(data:formData ,
          url: ApiConstant.changeprofiledata, token: token);
      return ProfileModel.fromJson(response.data);
    }on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<ProfileModel> changePassword(Map<String, dynamic> body) async{
    try {
      final response = await DioHelper.putData(data:body ,
          url: ApiConstant.changepassword, token: token);
      return ProfileModel.fromJson(response.data);
    }on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
 }