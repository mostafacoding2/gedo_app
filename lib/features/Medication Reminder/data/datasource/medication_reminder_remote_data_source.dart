import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/network/api_constant.dart';
import 'package:alzcare/core/network/error_message_model.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/dio_helper.dart';
import 'package:alzcare/features/Medication%20Reminder/data/model/medication_reminder_model.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/delete_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/get_all_medication_reminder_use_case.dart';
import 'package:dio/dio.dart';
abstract class BaseRemoteDataSourceMedicationReminder
{
  Future<MedicationReminderModel>createMedicationReminder(Map<String,dynamic>body);
  Future<List<DataMedicationReminderModel>>getAllMedicationReminder(GetAllMedicationReminderParameters getAllMedicationReminderParameters);
  Future<MedicationReminderModel>deleteMedicationReminder(DeleteMedicationReminderParameters deleteMedicationReminderParameters);
}
class RemoteDataSourceMedicationReminder extends BaseRemoteDataSourceMedicationReminder{
  @override
  Future<MedicationReminderModel> createMedicationReminder(Map<String, dynamic> body)async {
    try{
    final response= await DioHelper.postData(data:body,token: token,
        url: ApiConstant.postmedicationreminder);
    return MedicationReminderModel.fromJson(response.data);
  } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<List<DataMedicationReminderModel>> getAllMedicationReminder(GetAllMedicationReminderParameters Parameters)async {
    try {
      Response response = await DioHelper.getData(
          bearerToken: token,
          url: ApiConstant.getallmedicationreminder(
              Parameters.id));
      return response.data['data'] == null? []:List<DataMedicationReminderModel>.from(
          (response.data['data'] as List).map((e) => DataMedicationReminderModel.fromJson(e)));
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<MedicationReminderModel> deleteMedicationReminder(DeleteMedicationReminderParameters deleteMedicationReminderParameters) async{
    try{
      final response= await DioHelper.deleteData(url: ApiConstant.deletemedicationreminder(deleteMedicationReminderParameters.id),token: token);
      return MedicationReminderModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
}