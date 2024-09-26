import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/network/api_constant.dart';
import 'package:alzcare/core/network/error_message_model.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/dio_helper.dart';
import 'package:alzcare/features/health_care/data/model/medical%20details%20model.dart';
import 'package:alzcare/features/health_care/data/model/prescription%20model.dart';
import 'package:alzcare/features/health_care/data/model/test%20model.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_test_use_case.dart';
import 'package:dio/dio.dart';
abstract class BaseRemoteDataSource {
  Future<MedicalDetailsModel> createMedicalDetails(Map<String, dynamic> parameters);
  Future<List<DataModel>> getAllMedicalDetails(GetAllMedicalDetailsParameters getAllMedicalDetailsParameters);
  Future<MedicalDetailsModel> deleteMedicalDetails(DeleteMedicalDetailsParameters deleteMedicalDetailsParameters);
  Future<TestModel> createTest(FormData parameters);
  Future<List<DataTestModel>> getAllTests(GetAllTestsParameters getAllTestsParameters);
  Future<TestModel> getTest(GetTestsParameters getTestsParameters);
  Future<TestModel> deleteTests(DeleteTestsParameters deleteTestsParameters);
  Future<PrescriptionModel> createPrescription(FormData parameters);
  Future<List<DataPrescriptionModel>>getAllPrescription(GetAllPrescriptionParameters getAllPrescriptionParameters);
  Future<PrescriptionModel> deletePrescription(DeletePrescriptionParameters deletePrescriptionParameters);
  Future<PrescriptionModel> getPrescription(GetPrescriptionParameters getPrescriptionParameters);
}
class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<MedicalDetailsModel> createMedicalDetails(parameters) async {
    try {
      final response = await DioHelper.postData(
          token: token, url: ApiConstant.postmedicalDetails, data: parameters);
      return MedicalDetailsModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<List<DataModel>> getAllMedicalDetails(
      GetAllMedicalDetailsParameters getAllMedicalDetailsParameters) async {
    try {
      List<DataModel>tests=[];
      Response response = await DioHelper.getData(
          bearerToken: token,
          url: ApiConstant.getallmedicalDetails(
              getAllMedicalDetailsParameters.id));
      if(response.data['data'] is List<dynamic>){
        tests=(response.data['data'] as List<dynamic>).map((e) => DataModel.fromJson(e)).toList();
        return tests;
      }
      return tests;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<MedicalDetailsModel> deleteMedicalDetails(
      DeleteMedicalDetailsParameters deleteMedicalDetailsParameters) async {
    try {
      final response = await DioHelper.deleteData(
          token: token,
          url: ApiConstant.deletemedicalDetails(
              deleteMedicalDetailsParameters.id));
      return MedicalDetailsModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<TestModel> createTest(FormData parameters) async {
    try {
      final response = await DioHelper.postData(
          token: token, url: ApiConstant.posttest, data: parameters);
      return TestModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<List<DataTestModel>> getAllTests(
      GetAllTestsParameters getAllTestsParameters) async {
    try {
      List<DataTestModel> tests=[];
      final response = await DioHelper.getData(
          bearerToken: token, url: ApiConstant.getalltests(userId));
      if (response.data['data'] is List<dynamic>) {
        // Convert each element in the list to DataTestModel
        tests = (response.data['data'] as List<dynamic>)
            .map((e) => DataTestModel.fromJson(e))
            .toList();
        return tests;
      } return tests;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<TestModel> getTest(GetTestsParameters getTestsParameters) async {
    try {
      final response = await DioHelper.getData(
          bearerToken: token, url: ApiConstant.gettests(getTestsParameters.id));
      return TestModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<TestModel> deleteTests(
      DeleteTestsParameters deleteTestsParameters) async {
    try {
      final response = await DioHelper.deleteData(
          token: token, url: ApiConstant.deletetests(deleteTestsParameters.id));
      return TestModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<PrescriptionModel> createPrescription(FormData parameters) async {
    try {
      final response = await DioHelper.postData(
          url: ApiConstant.prescriptions, token: token, data: parameters);
      return PrescriptionModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<List<DataPrescriptionModel>> getAllPrescription(GetAllPrescriptionParameters getAllPrescriptionParameters) async{
    try {List<DataPrescriptionModel> tests=[];
      final response = await DioHelper.getData(
          url: ApiConstant.getallprescriptions(getAllPrescriptionParameters.id), bearerToken: token, );
      if (response.data['data'] is List<dynamic>) {
        // Convert each element in the list to DataTestModel
         tests = (response.data['data'] as List<dynamic>)
            .map((e) => DataPrescriptionModel.fromJson(e))
            .toList();
        return tests;
      }
      return tests;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }  }
  @override
  Future<PrescriptionModel> deletePrescription(DeletePrescriptionParameters deletePrescriptionParameters) async{
   try{
     final response=await DioHelper.deleteData(
         token: token,
         url: ApiConstant.deleteprescriptions(deletePrescriptionParameters.id));
     return PrescriptionModel.fromJson(response.data);
   }on DioException catch (error) {
     throw ServerException(
         errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
   }

  }
  @override
  Future<PrescriptionModel> getPrescription(GetPrescriptionParameters getPrescriptionParameters) async{
    try {
      final response = await DioHelper.getData(
          bearerToken: token, url: ApiConstant.getprescriptions(getPrescriptionParameters.id));
      return PrescriptionModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
}

