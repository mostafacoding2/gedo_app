part of 'prescription_cubit.dart';
abstract class PrescriptionState {}
 class PrescriptionInitialState extends PrescriptionState {}
class UploadImageState extends PrescriptionState {}
class CreatePrescriptionErrorState  extends PrescriptionState {
  final String error;
  CreatePrescriptionErrorState(this.error);
}
class CreatePrescriptionLoadingState  extends PrescriptionState {}
class  CreatePrescriptionSuccessState extends PrescriptionState {
  PrescriptionEntite prescriptionEntite;
  CreatePrescriptionSuccessState(this.prescriptionEntite);
}

class GetAllPrescriptionErrorState  extends PrescriptionState {
  final String error;
  GetAllPrescriptionErrorState(this.error);
}
class GetAllPrescriptionLoadingState  extends PrescriptionState {}
class  GetAllPrescriptionSuccessState extends PrescriptionState {
  List<DataPrescription>dataPrescription=[];
   GetAllPrescriptionSuccessState(this.dataPrescription);
}
class DeletePrescriptionErrorState  extends PrescriptionState {
  final String error;
  DeletePrescriptionErrorState(this.error);
}
class DeletePrescriptionLoadingState  extends PrescriptionState {}
class  DeletePrescriptionSuccessState extends PrescriptionState {

}

class GetPrescriptionErrorState  extends PrescriptionState {
  final String error;
  GetPrescriptionErrorState(this.error);
}
class GetPrescriptionLoadingState  extends PrescriptionState {}
class  GetPrescriptionSuccessState extends PrescriptionState {
 final PrescriptionEntite prescriptionEntite;
  GetPrescriptionSuccessState(this.prescriptionEntite);
}