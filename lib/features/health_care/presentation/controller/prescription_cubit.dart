import 'dart:async';
import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/create_prescription_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'prescription_state.dart';
class PrescriptionCubit extends Cubit<PrescriptionState> {
  PrescriptionCubit(
      this.getPrescriptionUseCase,
      this.deletePrescriptionUseCase,
      this.getAllPrescriptionUseCase,
      this.postPrescriptionUseCase
      ) : super(PrescriptionInitialState());
  static PrescriptionCubit get(context) => BlocProvider.of(context);
  XFile? imagepicker;
  pickImage(XFile image){
    imagepicker=image;
    emit(UploadImageState());
  }
  PostPrescriptionUseCase postPrescriptionUseCase;
  FutureOr<void> createPrescription({
    required String date,
    required String notes,
    required String attendingPhysician,
  })async{
    emit(CreatePrescriptionLoadingState());
    var formData=FormData.fromMap({
       'prescriptionImage':  [  await uploadimagetoapi(imagepicker!)],
      'date': date,
      'notes': notes,
      'attendingPhysician': attendingPhysician
    });
final result=await postPrescriptionUseCase(formData);
    result.fold((l) {
    emit(CreatePrescriptionErrorState(l.message));},
            (r){
          emit(CreatePrescriptionSuccessState(r));
        });}
 GetAllPrescriptionUseCase getAllPrescriptionUseCase;
  List<DataPrescription>dataPrescription=[];

  FutureOr<void>getAllPrescription({required String id})async{
  emit(GetAllPrescriptionLoadingState());
    final result=await getAllPrescriptionUseCase(GetAllPrescriptionParameters(id: id));
     result.fold((l) {
      emit(GetAllPrescriptionErrorState(l.message));
    }, (r)
    {dataPrescription=r;
      emit(GetAllPrescriptionSuccessState(r));
    });
  }
  DeletePrescriptionUseCase deletePrescriptionUseCase;
  FutureOr<void>deletePrescription({required String id})async{
    emit(DeletePrescriptionLoadingState());
    final result=await deletePrescriptionUseCase(DeletePrescriptionParameters(id: id));
    result.fold((l) {
      emit(DeletePrescriptionErrorState(l.message));
    }, (r) {
      emit(DeletePrescriptionSuccessState());
    });
  }
  GetPrescriptionUseCase getPrescriptionUseCase;
  PrescriptionEntite ?prescriptionEntite;
  FutureOr<void>getPrescription({required String id})async{
    emit(GetPrescriptionLoadingState());
    final result=await getPrescriptionUseCase(GetPrescriptionParameters(id:id));
    result.fold((l) {

      emit(GetPrescriptionErrorState(l.message));
    }, (r) {
      prescriptionEntite=r;
      emit(GetPrescriptionSuccessState(r));
    });
  }




}

uploadimagetoapi(XFile image) {
  return    MultipartFile.fromFile(image.path,filename:image.path.split('/').last );
}
