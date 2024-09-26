 import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/entites/medication_reminder_entity.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/delete_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/get_all_medication_reminder_use_case.dart';
import 'package:dartz/dartz.dart';
abstract class MedicationReminderBaseRepository
 {
  Future<Either<Failure,MedicationReminderEntity>>createMedicationReminder(Map<String,dynamic>body);
  Future<Either<Failure,List<DataMedicationReminder>>>getAllMedicationReminder(GetAllMedicationReminderParameters getAllMedicationReminderParameters);
  Future<Either<Failure,MedicationReminderEntity>>deleteMedicationReminder(DeleteMedicationReminderParameters deleteMedicationReminderParameters);
 }