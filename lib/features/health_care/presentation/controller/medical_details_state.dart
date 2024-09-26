part of 'medical_details_cubit.dart';
abstract class MedicalDetailsState  {
  const MedicalDetailsState();
}
class MedicalDetailsInitialState extends MedicalDetailsState {}

class CreateMedicalDetailsLoadingState extends MedicalDetailsState {}
class CreateMedicalDetailsSuccessState extends MedicalDetailsState {
  MedicalDetailsEntity medicalDetailsEntity;
  CreateMedicalDetailsSuccessState(this.medicalDetailsEntity);
}
class CreateMedicalDetailsErrorState extends MedicalDetailsState
{
  final dynamic error;
  CreateMedicalDetailsErrorState(this.error);
}
class GetAllMedicalDetailsLoadingState extends MedicalDetailsState {}
class GetAllMedicalDetailsSuccessState extends MedicalDetailsState {
 List<DataMedical> data;
GetAllMedicalDetailsSuccessState(this.data);
}
class GetAllMedicalDetailsErrorState extends MedicalDetailsState
{
  final String error;
  GetAllMedicalDetailsErrorState(this.error);}
class DeleteMedicalDetailsLoadingState extends MedicalDetailsState {}
class DeleteMedicalDetailsSuccessState extends MedicalDetailsState {
}
class DeleteMedicalDetailsErrorState extends MedicalDetailsState
{
  final String error;
  DeleteMedicalDetailsErrorState(this.error);
}








