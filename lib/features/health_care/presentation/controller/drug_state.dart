part of 'drug_cubit.dart';

@immutable
abstract class DrugState {}

class DrugInitial extends DrugState {}


class FoodInteractionSuccessState extends DrugState {}
class FoodInteractionLoadingState extends DrugState {}
class FoodInteractionErrorState extends DrugState
{
  final String message;

  FoodInteractionErrorState({required this.message});
}

class DrugInteractionSuccessState extends DrugState {}
class DrugInteractionLoadingState extends DrugState {}
class DrugInteractionErrorState extends DrugState
{
  final String message;

  DrugInteractionErrorState({required this.message});
}

class DrugInfoSuccessState extends DrugState {}
class DrugInfoLoadingState extends DrugState {}
class DrugInfoErrorState extends DrugState
{
  final String message;

  DrugInfoErrorState({required this.message});
}
