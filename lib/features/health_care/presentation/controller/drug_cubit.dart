import 'package:alzcare/core/network/api_constant.dart';
import 'package:alzcare/features/health_care/data/model/drug_info_model.dart';
import 'package:alzcare/features/health_care/data/model/drug_interaction_model.dart';
import 'package:alzcare/features/health_care/data/model/food_interaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'drug_state.dart';

class DrugCubit extends Cubit<DrugState> {
  DrugCubit() : super(DrugInitial());

  static DrugCubit get(context) => BlocProvider.of(context);

  FoodInteractionModel? foodInteractionModel;

  Future foodInteraction({
    required String drugName,
    required String foodName,
  }) async {
    emit(FoodInteractionLoadingState());

    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: 'http://52.203.210.190:8000/',
          connectTimeout: const Duration(seconds: 15),
        ),
      ).get('find_food_interaction', queryParameters: {
        "drug_name": drugName,
        "food_name": foodName,
      });
      foodInteractionModel = FoodInteractionModel.fromJson(response.data);
      emit(FoodInteractionSuccessState());
    } on DioException catch (error) {
      emit(FoodInteractionErrorState(
          message:
              error.response != null ? error.response!.data : 'خطأ في الخادم'));
    }
  }

  DrugInteractionModel? drugInteractionModel;

  Future drugInteraction({
    required String drugName,
    required String secondDrugName,
  }) async {
    emit(DrugInteractionLoadingState());
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: 'http://52.203.210.190:8000/',
          connectTimeout: const Duration(seconds: 15),
        ),
      ).get('find_interaction', queryParameters: {
        "drug1": drugName,
        "drug2": secondDrugName,
      });
      print(response);
      drugInteractionModel =
          DrugInteractionModel.fromJson(response.data);
      emit(DrugInteractionSuccessState());
    } on DioException catch (error) {
      emit(DrugInteractionErrorState(
          message:
              error.response != null ? error.response!.data : 'خطأ في الخادم'));
    }
  }

  DrugInfoModel? drugInfoModel;

  Future drugInfo({
    required String drugName,
  }) async {
    emit(DrugInfoLoadingState());

    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: 'http://52.203.210.190:8000/',
          connectTimeout: const Duration(seconds: 15),
        ),
      ).get('search_drug_info', queryParameters: {
        "drug_name": drugName,
      });
      print(response);
      drugInfoModel =
          DrugInfoModel.fromJson(response.data['drug_info_message']);
      emit(DrugInfoSuccessState());
    } on DioException catch (error) {
      emit(DrugInfoErrorState(
          message:
              error.response != null ? error.response!.data : 'خطأ في الخادم'));
    }
  }
}
