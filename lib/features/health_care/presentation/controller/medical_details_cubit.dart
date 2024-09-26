import 'dart:async';
import 'package:alzcare/features/health_care/domain/entites/medical%20details_entity.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/create_medical_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part'medical_details_state.dart';
class MedicalDetailsCubit extends Cubit<MedicalDetailsState> {
  MedicalDetailsCubit(
      this.postmedicalDetailsUseCase,
      this.getMedicalDetailsUseCase,
      this.deleteMedicalDetailsUseCase
      ) : super(MedicalDetailsInitialState());
  static MedicalDetailsCubit get(context) => BlocProvider.of(context);
  PostMedicalDetailsUseCase postmedicalDetailsUseCase;
  Future createMedicalDetails
      (
      String ?name2,
  {
    required String bloodType,
    required String sensitivities,
    required String chronicDiseases,
    required bool permanentMedications,
    required String name1,
  }) async {
    emit(CreateMedicalDetailsLoadingState());
    final result=await postmedicalDetailsUseCase(
        {
      'bloodType':bloodType,
      'sensitivities':sensitivities,
      'chronicDiseases':chronicDiseases,
      'permanentMedications':permanentMedications,
          if(permanentMedications==false)
       'medications':[
         {
        "name":name1,
       },],
         if(permanentMedications==true)
           'medications':[
             {
               "name":name1,
             },
             {
               "name":name2,
             },
           ],
             }
    );
    result.fold((l){
    emit(CreateMedicalDetailsErrorState(l.message));},
            (r) {
    emit(CreateMedicalDetailsSuccessState(r));
  });
}

//ge-allMedicalDetails
  GetMedicalDetailsUseCase getMedicalDetailsUseCase;
  List <DataMedical>dataMedical=[];

  FutureOr<void> getMedicalDetails({required String id})async {
    emit(GetAllMedicalDetailsLoadingState());
    final result = await getMedicalDetailsUseCase(GetAllMedicalDetailsParameters(id: id) );
    result.fold(
            (l) => emit(GetAllMedicalDetailsErrorState(l.message)),
            (r) {
              dataMedical=r;
              emit(
                GetAllMedicalDetailsSuccessState(r));
            });
  }
  //delete MedicalDetails

  DeleteMedicalDetailsUseCase deleteMedicalDetailsUseCase;

  FutureOr<void> deleteMedicalDetails ({required String id}) async {
    emit(DeleteMedicalDetailsLoadingState());
    final result =await deleteMedicalDetailsUseCase(DeleteMedicalDetailsParameters(id: id));
    result.fold((l) {emit(DeleteMedicalDetailsErrorState(l.message));},
       (r) {
      emit(  DeleteMedicalDetailsSuccessState());});
  }



}
