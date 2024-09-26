part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {}

class PickedImageSuccessState extends HomeState {}


class DetectionSuccessState extends HomeState {}
class DetectionLoadingState extends HomeState {}
class DetectionErrorState extends HomeState
{
  final String message;

  DetectionErrorState({required this.message});
}

