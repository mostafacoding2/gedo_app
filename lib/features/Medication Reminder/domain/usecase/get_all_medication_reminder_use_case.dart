import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/base_repository/medication_reminder_base_repository.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/entites/medication_reminder_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class GetAllMedicationReminderUseCase extends BaseUseCase< List<DataMedicationReminder>,GetAllMedicationReminderParameters > {
  MedicationReminderBaseRepository baseRepository;
  GetAllMedicationReminderUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<DataMedicationReminder>>> call( GetAllMedicationReminderParameters parameters) async {
    return await baseRepository.getAllMedicationReminder(parameters);
  }
}
class GetAllMedicationReminderParameters extends Equatable {
  final String id;
  const GetAllMedicationReminderParameters({ required this.id});
  @override
  List<Object> get props => [id];
}