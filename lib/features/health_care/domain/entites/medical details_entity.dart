import 'package:equatable/equatable.dart';
class MedicalDetailsEntity extends Equatable {
  final String? status;
  final int? code;
  final String? message;
 final  DataMedical ?data;
  MedicalDetailsEntity(
      {required this.status,
      required this.code,
      required this.message,
      required this.data});
  @override
  List<Object?> get props => [status, code, message, data];
}
class DataMedical extends Equatable {
  final String? user;
  final String ?bloodType;
  final String ?sensitivities;
  final String ?chronicDiseases;
  final bool ? permanentMedications;
  final String  ? id;
  final List<Medications>? medications;
  DataMedical(
      {
        required this.id,
        required this.medications,
      required this.user,
      required this.bloodType,
      required this.sensitivities,
      required this.chronicDiseases,
      required this.permanentMedications});

  @override
  List<Object?> get props => [
        id,
        user,
        bloodType,
        sensitivities,
        chronicDiseases,
        permanentMedications,
        medications
      ];
}
class Medications extends Equatable {
  final String name;
  final String id;

  Medications({required this.name, required this.id});

  @override
  List<Object> get props => [name, id];
}
