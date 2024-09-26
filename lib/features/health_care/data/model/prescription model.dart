import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
class PrescriptionModel extends PrescriptionEntite{
  PrescriptionModel({
    required super.status,
    required super.code,
    required super.message,
    required super.dataPrescription
  });
factory  PrescriptionModel.fromJson(Map<String, dynamic> json)=>PrescriptionModel(
  status: json['status'],
  code: json['code'],
  message: json['message'],
   // edit by ahmed
    dataPrescription: json['data']!=null &&json['data'] is Map<String,dynamic>?DataPrescriptionModel.fromJson(json['data']):null
  );
}
class DataPrescriptionModel extends DataPrescription{
  DataPrescriptionModel({required super.user,
    required super.date,
    required super.notes,
    required super.attendingPhysician,
    required super.id,
    required super.prescriptionImage});
  factory DataPrescriptionModel.fromJson(Map<String, dynamic> json)=>DataPrescriptionModel(
      user: json['user'],
      date: json['date'],
      notes: json['notes'],
      attendingPhysician: json['attendingPhysician'],
      id: json['_id'],
      // prescriptionImage: json['prescriptionImage']!=null?PrescriptionImageModel.fromJson(json['prescriptionImage']):null
      //edit by ahmed
     prescriptionImage:json['prescriptionImage'] != null && json['prescriptionImage'] is Map<String,dynamic> ? PrescriptionImageModel.fromJson(json['prescriptionImage']) : null
      //json['prescriptionImage']!=null && json['prescriptionImage']is Map<String,dynamic>?PrescriptionImageModel.fromJson(json['prescriptionImage']):null
  );

}
class PrescriptionImageModel extends PrescriptionImage{
  PrescriptionImageModel({required super.url, required super.publicId});
  factory PrescriptionImageModel.fromJson(Map<String, dynamic> json)=>PrescriptionImageModel(url: json['url'], publicId: json['publicId']);

}