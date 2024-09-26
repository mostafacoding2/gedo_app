import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Medication%20Reminder/data/datasource/medication_reminder_remote_data_source.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/base_repository/medication_reminder_base_repository.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/entites/medication_reminder_entity.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/delete_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/get_all_medication_reminder_use_case.dart';
import 'package:dartz/dartz.dart';
class MedicationReminderRepository extends MedicationReminderBaseRepository {
  BaseRemoteDataSourceMedicationReminder medicationReminderBaseRemoteDataSource;
  MedicationReminderRepository(this.medicationReminderBaseRemoteDataSource);
  @override
  Future<Either<Failure, MedicationReminderEntity>> createMedicationReminder(
      Map<String, dynamic> body) async {
    try {
      final result = await medicationReminderBaseRemoteDataSource
          .createMedicationReminder(body);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, List<DataMedicationReminder>>> getAllMedicationReminder(GetAllMedicationReminderParameters getAllMedicationReminderParameters)async {
    try {
      final result = await medicationReminderBaseRemoteDataSource
          .getAllMedicationReminder(getAllMedicationReminderParameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MedicationReminderEntity>> deleteMedicationReminder(DeleteMedicationReminderParameters deleteMedicationReminderParameters)async {
    try {
      final result = await medicationReminderBaseRemoteDataSource.deleteMedicationReminder(deleteMedicationReminderParameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }



}
