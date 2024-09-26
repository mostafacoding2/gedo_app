import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/base_repository/medication_reminder_base_repository.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/entites/medication_reminder_entity.dart';
import 'package:dartz/dartz.dart';
class PostMedicationReminderUseCase extends BaseUseCase<MedicationReminderEntity,Map<String,dynamic>>{
  MedicationReminderBaseRepository medicationReminderBaseRepositry;
  PostMedicationReminderUseCase(this.medicationReminderBaseRepositry);
  @override
  Future<Either<Failure, MedicationReminderEntity>> call(Map<String, dynamic> parameters) async{
    return await medicationReminderBaseRepositry.createMedicationReminder(parameters);
  }
}
