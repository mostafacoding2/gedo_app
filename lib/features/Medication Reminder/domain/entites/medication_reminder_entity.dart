import 'package:equatable/equatable.dart';
class MedicationReminderEntity extends Equatable {
  final String? status;
  final int? code;
  final String? message;
  final DataMedicationReminder? dataMedicationReminder;
  const MedicationReminderEntity(
      { required this.status, required this.code, required this.message, required this.dataMedicationReminder});
  @override
  List<Object?> get props => [status, code, message, dataMedicationReminder];
}
class DataMedicationReminder extends Equatable {
  final String? user;
  final String? medicationName;
  final String? usageSchedule;
  final List<String>? daysOfWeek;
  final List<String>? times;
  final String? endDate;
  final String? id;
  const DataMedicationReminder(
      {required this.user,required this.medicationName,required this.usageSchedule,required this.daysOfWeek,required this.times,required this.endDate,required this.id, });
  @override
  List<Object?> get props =>
      [user, medicationName, usageSchedule, daysOfWeek, times, endDate, id,];
}