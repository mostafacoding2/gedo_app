import 'package:alzcare/features/Community/presentation/screens/community_screen.dart';
import 'package:alzcare/features/home_data/model/detection_model.dart';
import 'package:alzcare/features/home_data/presentation/screens/home_screen.dart';
import 'package:alzcare/features/Community/presentation/screens/notification_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/item_selected_picked.dart';
import 'package:alzcare/features/profile/presentation/screens/profile_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    const CommunityScreen(),
    const NotificationScreen(),
    const ProfileScreen(),

  ];
  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }


  void imagePicker(BuildContext context) {
    showDialog(
      barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
      context: context,
      builder: (BuildContext context) {
        return PickedImage(
          onPressedCamera: () async {
            Navigator.pop(context); // Close the dialog
            await runFilePikerCamera();

          },
          onPressedGallery: () async {
            Navigator.pop(context); // Close the dialog
            await runFilePikerGallery();
          },
        );
      },
    );
  }

  XFile? pickedImage;

  Future<void> runFilePikerGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage = pickedFile;

emit(PickedImageSuccessState());
    }
  }

  Future<void> runFilePikerCamera() async {

    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedImage = pickedFile;
      emit(PickedImageSuccessState());

    }
  }


  DetectionModel detectionModel = DetectionModel(detectionMessage: 'مصاااااب' , detectionTitle: 'fjkfdfds');

  Future<MultipartFile> uploadImageToApi(XFile image) async {
    return MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
  }
  Future detectWhiteWaterDisease() async {
    emit(DetectionLoadingState());
    try {
      final image = await uploadImageToApi(pickedImage!);

      final formData = FormData.fromMap({
        "image": image,
      });
      final response = await Dio(
        BaseOptions(
          baseUrl: 'http://54.166.244.10:8000/',
          connectTimeout: const Duration(seconds: 15),
        ),
      ).post('eyepredict', data:formData,);
      print(response);
      print(response.statusCode);
      print('eqwiuweu nxnocjjcuxn');

      if(response.statusCode == 200 || response.statusCode == 400)
      {
        print('klsakdsfakljdsksdf');
        detectionModel = DetectionModel.fromJson(response.data);
        emit(DetectionSuccessState());
      }
    } on DioException catch (error) {
      emit(DetectionErrorState(
          message: error.response != null ? error.response!.data : 'خطأ في الخادم'));
    }
  }
  Future detectSkinDisease() async {
    emit(DetectionLoadingState());
    try {
      final image = await uploadImageToApi(pickedImage!);

      final formData = FormData.fromMap({
        "image": image,
      });
      final response = await Dio(
        BaseOptions(
          baseUrl: 'http://54.166.244.10:8000/',
          connectTimeout: const Duration(seconds: 15),
        ),
      ).post('skinpredict', data:formData,);
      print(response);
      if(response.statusCode == 200 || response.statusCode == 400)
      {
        detectionModel = DetectionModel.fromJson(response.data);
        emit(DetectionSuccessState());
      }
    } on DioException catch (error) {
      emit(DetectionErrorState(
          message:
          error.response != null ? error.response!.data : 'خطأ في الخادم'));
    }
  }

}
