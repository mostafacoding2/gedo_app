import 'package:alzcare/features/Medication%20Reminder/domain/entites/medication_reminder_entity.dart';
class MedicationReminderModel extends MedicationReminderEntity{
  MedicationReminderModel({required super.status, required super.code, required super.message, required super.dataMedicationReminder});
 factory MedicationReminderModel.fromJson(Map<String, dynamic> json)=>MedicationReminderModel(
     status: json['status'],
     code: json['code'],
     message: json['message'],
  dataMedicationReminder:     json['data'] != null && json['data'] is Map<String, dynamic> ? DataMedicationReminderModel.fromJson(json['data']) : null
 );
}
class DataMedicationReminderModel extends DataMedicationReminder{
  DataMedicationReminderModel({required super.user, required super.medicationName, required super.usageSchedule, required super.daysOfWeek, required super.times, required super.endDate, required super.id});
  factory DataMedicationReminderModel.fromJson(Map<String, dynamic> json)=>DataMedicationReminderModel(
      user: json['user'],
      medicationName: json['medicationName'],
      usageSchedule: json['usageSchedule'],
      daysOfWeek:  json["daysOfWeek"] == null ? null : List<String>.from(json["daysOfWeek"]),
      times: json["times"] == null ? null : List<String>.from(json["times"]),
      endDate: json['endDate'],
      id: json['_id']
  );
}