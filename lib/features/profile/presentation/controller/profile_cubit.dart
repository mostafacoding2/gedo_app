import 'dart:async';
import 'package:alzcare/features/profile/domain/entites/profile_entity.dart';
import 'package:alzcare/features/profile/domain/usecase/change_password_use_case.dart';
import 'package:alzcare/features/profile/domain/usecase/change_profile_data_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_state.dart';
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.changePasswordUseCase,this.changeProfileImageUseCase) : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);
 XFile? imagepicker;
  uploadimage(XFile image){
    imagepicker=image;
    emit(UploadImageState());
  }
  ChangeprofiledataUseCase  changeProfileImageUseCase;
 ProfileEntity ?profileEntity;
  FutureOr<void> changeDataProfile({
     String ?username,
     String ?email,
  })async{
    emit(ProfileLoadingState());
    FormData formData;
    if (imagepicker != null) {
      formData = FormData.fromMap({
        'profileImg': [await uploadimagetoapi(image: imagepicker!)],
        'Uname': username,
        'mail': email      });
    } else {
      formData = FormData.fromMap({
        'Uname': username,
        'mail': email      });
    }
    final result=await changeProfileImageUseCase(formData);
    result.fold((l) {
    emit(ProfileErrorState(l.message));}, (r){
      {
        profileEntity=r;
        emit(ProfileSuccessState(r));
      }
        });
  }

  ChangePasswordUseCase changePasswordUseCase;
  FutureOr<void> changePassword({
    required String oldPassword,
    required String newPassword,
  })async{
    emit(ChangePasswordLoadingState());

    final result=await changePasswordUseCase({
      "oldPassword": oldPassword,
      "newPassword" :newPassword
    });
    result.fold((l) {
    emit(ChangePasswordErrorState(l.message));}, (r){
      {
        emit(ChangePasswordSuccessState());
      }
    });
  }
}
 uploadimagetoapi({ required XFile image}) async{
  return  await  MultipartFile.fromFile(image.path,filename:image.path.split('/').last );
}