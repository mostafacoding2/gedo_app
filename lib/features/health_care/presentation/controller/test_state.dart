part of 'test_cubit.dart';

abstract class TestState  {
  const TestState();
  }
  class TestInitialState extends TestState {}
  class CreateTestLoadingState extends TestState {}
class UploadImageState extends TestState {}
  class CreateTestSuccessState extends TestState {
  TestEntite testEntite ;
  CreateTestSuccessState(this.testEntite);}
  class CreateTestErrorState extends TestState
  {
  final String error;
  CreateTestErrorState(this.error);
  }

class GetAllTestLoadingState extends TestState {}
class GetAllTestSuccessState extends TestState {
  List <DataTest>dataTest=[];
  GetAllTestSuccessState(this.dataTest);
}
class GetAllTestErrorState extends TestState
{
  final String error;
  GetAllTestErrorState(this.error);
}
class GetTestLoadingState extends TestState {}
class GetTestSuccessState extends TestState {
  final TestEntite testEntite;
  GetTestSuccessState(this.testEntite);
}
class GetTestErrorState extends TestState
{
  final String error;
  GetTestErrorState(this.error);
}
class DeleteTestLoadingState extends TestState {}
class DeleteTestSuccessState extends TestState {
  // TestStateList <DataTest>dataTest=[];
  // DeleteTestSuccessState(this.dataTest);
}
class DeleteTestErrorState extends TestState
{
  final String error;
  DeleteTestErrorState(this.error);
}