import 'dart:async';
import 'package:alzcare/features/Medication%20Reminder/domain/entites/medication_reminder_entity.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/delete_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/get_all_medication_reminder_use_case.dart';
import 'package:alzcare/features/Medication%20Reminder/domain/usecase/create_medication_reminder_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'medication_reminder_state.dart';
class MedicationReminderCubit extends Cubit<MedicationReminderState> {
  MedicationReminderCubit(
      this.deleteMedicationReminderUseCase,
      this.getAllMedicationReminderUseCase,
      this.postMedicationReminderUseCase) : super(MedicationReminderInitial());
  static MedicationReminderCubit get(context) => BlocProvider.of(context);
  PostMedicationReminderUseCase postMedicationReminderUseCase;
  Future createMedicationReminderWeekly(  {
    required String medicationName,
    required String usageSchedule,
    required List <String>days   ,
    required  List <String>times,
    required String endDate,}
  )async{
    emit(CreateMedicationReminderLoadingState());
    final result=await postMedicationReminderUseCase({
        "medicationName": medicationName,
        "usageSchedule": usageSchedule,
        "daysOfWeek": days,
        "times":times,
        "endDate": endDate
    });
     result.fold((l){
      emit(CreateMedicationReminderErrorState(l.message));
    }, (r){
    emit(CreateMedicationReminderSuccessState());
    });
  }
  Future createMedicationReminderDaily(
      {
        required String medicationName,
        required String usageSchedule,
        required  List <String>times,
        required String endDate,
      }
      )async{
    emit(CreateMedicationReminderLoadingState());
    final result=await postMedicationReminderUseCase({
      "medicationName": medicationName,
      "usageSchedule": usageSchedule,
      "times":times,
      "endDate": endDate
    });
    result.fold((l){
      emit(CreateMedicationReminderErrorState(l.message));
    }, (r){
      emit(CreateMedicationReminderSuccessState());
    });
  }
  Future createMedicationReminderMonthly(
      {
        required String medicationName,
        required String usageSchedule,
        required  List <String>times,
        required String endDate,
      }
      )async{
    emit(CreateMedicationReminderLoadingState());
    final result=await postMedicationReminderUseCase({
      "medicationName": medicationName,
      "usageSchedule": usageSchedule,
      "times":times,
      "endDate": endDate
    });
    result.fold((l){
      emit(CreateMedicationReminderErrorState(l.message));
    }, (r){
      emit(CreateMedicationReminderSuccessState());
    });
  }
  GetAllMedicationReminderUseCase getAllMedicationReminderUseCase;
   List<DataMedicationReminder> data=[];
  FutureOr<void>getAllMedicationReminder({required String userId})async{
    emit(GetAllMedicationReminderLoadingState());
    final result=await getAllMedicationReminderUseCase(GetAllMedicationReminderParameters(id: userId));
    result.fold((l) {
      emit(GetAllMedicationReminderErrorState(l.message));
    }, (r) {
      data=r;
      emit(GetAllMedicationReminderSuccessState(r));
    });
  }
  DeleteMedicationReminderUseCase deleteMedicationReminderUseCase;
  Future deleteMedicationReminder({required String id})async{
    emit(DeleteMedicationReminderLoadingState());
    final result=await deleteMedicationReminderUseCase(DeleteMedicationReminderParameters(id: id));
    result.fold((l) {
      emit(DeleteMedicationReminderErrorState(l.message));
    }, (r) {
      emit(DeleteMedicationReminderSuccessState());
    });}}