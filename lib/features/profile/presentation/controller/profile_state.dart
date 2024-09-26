part of 'profile_cubit.dart';
@immutable
abstract class ProfileState {}
 class ProfileInitialState extends ProfileState {}
class ProfileLoadingState  extends ProfileState {}
class UploadImageState  extends ProfileState {}

class ProfileErrorState  extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
}
class ProfileSuccessState  extends ProfileState {
 final ProfileEntity profileEntity;
  ProfileSuccessState(this.profileEntity);
}

class ChangePasswordLoadingState  extends ProfileState {}

class ChangePasswordErrorState  extends ProfileState {
  final String error;
  ChangePasswordErrorState(this.error);
}
class ChangePasswordSuccessState  extends ProfileState {

}