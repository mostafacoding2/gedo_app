import 'package:equatable/equatable.dart';
class PrescriptionEntite extends Equatable {
  final String status;
  final int code;
  final String message;
  final DataPrescription ? dataPrescription;
  const PrescriptionEntite(
      { required this.status, required this.code, required this.message, required this.dataPrescription});
  @override
  List<Object?> get props => [status, code, message, dataPrescription];
}
class DataPrescription extends Equatable {
  final String user;
  final String date;
  final String notes;
  final String attendingPhysician;
  final String id;
  final PrescriptionImage? prescriptionImage;

  const DataPrescription({required this.user,
    required this.date,
    required this.notes,
    required this.attendingPhysician,
    required this.id,
    required this.prescriptionImage});
  @override
  List<Object?> get props =>
      [user, date, notes, attendingPhysician, id, prescriptionImage,];
}
class PrescriptionImage extends Equatable {
  final String url;
  final String publicId;
  const PrescriptionImage({required this.url, required this.publicId});
  @override
  // TODO: implement props
  List<Object?> get props => [url, publicId];
}