part of 'medication_reminder_cubit.dart';
@immutable
abstract class MedicationReminderState {}
 class MedicationReminderInitial extends MedicationReminderState {}
class CreateMedicationReminderErrorState  extends MedicationReminderState {
  final String error;
  CreateMedicationReminderErrorState(this.error);
}
class CreateMedicationReminderLoadingState  extends MedicationReminderState {}
class  CreateMedicationReminderSuccessState extends MedicationReminderState {
}
class GetAllMedicationReminderErrorState  extends MedicationReminderState {
  final String error;
  GetAllMedicationReminderErrorState(this.error);
}
class GetAllMedicationReminderLoadingState  extends MedicationReminderState {}
class GetAllMedicationReminderSuccessState extends MedicationReminderState {
 final List<DataMedicationReminder>data;
 GetAllMedicationReminderSuccessState(this.data);
}

class DeleteMedicationReminderErrorState  extends MedicationReminderState {
  final String error;
  DeleteMedicationReminderErrorState(this.error);
}
class DeleteMedicationReminderLoadingState  extends MedicationReminderState {}
class DeleteMedicationReminderSuccessState extends MedicationReminderState {

}