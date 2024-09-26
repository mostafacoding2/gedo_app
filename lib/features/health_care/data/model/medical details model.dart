import 'package:alzcare/features/health_care/domain/entites/medical%20details_entity.dart';

class MedicalDetailsModel extends MedicalDetailsEntity {
  MedicalDetailsModel(
      {required super.status,
      required super.code,
      required super.message,
      required super.data});
  factory MedicalDetailsModel.fromJson(Map<String, dynamic> json) =>MedicalDetailsModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? json['data'] != null ? DataModel.fromJson(json['data'] ): null : null,
  );}
class DataModel extends DataMedical {
  DataModel({required super.id,
    required super.medications,
      required super.user,
      required super.bloodType,
      required super.sensitivities,
      required super.chronicDiseases,
      required super.permanentMedications});
  factory DataModel.fromJson(Map<String, dynamic> json) =>DataModel(
    medications: List<MedicationsModel>.from(json['medications'].map((x)=>MedicationsModel.fromJson(x))),
      user:json['user'],
      bloodType: json['bloodType'],
      sensitivities:json['sensitivities'],
      chronicDiseases: json['chronicDiseases'],
      permanentMedications: json['permanentMedications'],
    id: json['_id']
  );
}
class MedicationsModel extends Medications {
  MedicationsModel({required super.name, required super.id});
  factory MedicationsModel.fromJson(Map<String, dynamic> json) =>
      MedicationsModel
        (
          name: json['name'],
          id: json['_id']
      );
}
