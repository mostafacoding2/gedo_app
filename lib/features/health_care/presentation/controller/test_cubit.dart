import 'dart:async';
import 'package:alzcare/features/health_care/domain/entites/test_entity.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_test_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/create_test_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'test_state.dart';
class TestCubit extends Cubit<TestState> {
  TestCubit(this.deleteTestsUseCase, this.postTestUseCase,
      this.getAllTestsUseCase, this.getTestUseCase)
      : super(TestInitialState());
  static TestCubit get(context) => BlocProvider.of(context);
  XFile? imagepicker;
  pickImage(XFile image) {
    imagepicker = image;
    emit(UploadImageState());
  }
  PostTestUseCase postTestUseCase;
  Future createTest(
      {required String date,
      required String testName,
      required String laboratoryName,
      required String attendingPhysician}) async {
    emit(CreateTestLoadingState());
    var formData = FormData.fromMap({
      if (imagepicker != null)
        'testImage': [await uploadimagetoapi(imagepicker!)],
      'date': date,
      'testName': testName,
      'laboratoryName': laboratoryName,
      'attendingPhysician': attendingPhysician
    });
    final result = await postTestUseCase(formData);
    result.fold((l) {
      emit(CreateTestErrorState(l.message));
    }, (r) {
      emit(CreateTestSuccessState(r));
    });
  }

  GetAllTestsUseCase getAllTestsUseCase;
  List<DataTest> dataTest = [];

  FutureOr<void> getAllTests({required String id}) async {
    emit(GetAllTestLoadingState());
    final result = await getAllTestsUseCase(GetAllTestsParameters(id: id));
    result.fold((l) {
      emit(GetAllTestErrorState(l.message));
    }, (r) {
      dataTest = r;
      emit(GetAllTestSuccessState(r));
    });
  }

  GetTestUseCase getTestUseCase;
  TestEntite? testEntite;

  FutureOr<void> getTest({required String id}) async {
    emit(GetTestLoadingState());
    final result = await getTestUseCase(GetTestsParameters(id: id));
    result.fold((l) {
      emit(GetTestErrorState(l.message));
    }, (r) {
      testEntite = r;
      emit(GetTestSuccessState(r));
    });
  }

  DeleteTestsUseCase deleteTestsUseCase;

  FutureOr<void> deleteTests({required String id}) async {
    emit(DeleteTestLoadingState());
    final result = await deleteTestsUseCase(DeleteTestsParameters(id: id));
    result.fold((l) {
      emit(DeleteTestErrorState(l.message));
    }, (r) {
      emit(DeleteTestSuccessState());
    });
  }
}

uploadimagetoapi(XFile image) {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
