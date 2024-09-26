import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/data/datasource/remote_data_source.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/medical%20details_entity.dart';
import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
import 'package:alzcare/features/health_care/domain/entites/test_entity.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_test_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class RepositoryHealthCare extends BaseRepository{
  BaseRemoteDataSource baseRemoteDataSource;
  RepositoryHealthCare(this.baseRemoteDataSource);
  @override
  Future<Either<Failure, MedicalDetailsEntity>> createMedicalDetails(Map<String, dynamic> body)async  {
     try {
      final result = await baseRemoteDataSource.createMedicalDetails(body);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
   }
  @override
  Future<Either<Failure, List<DataMedical>>> getAllMedicalDetails( GetAllMedicalDetailsParameters getAllMedicalDetailsParameters)async {
 try{ final  result= await baseRemoteDataSource.getAllMedicalDetails(getAllMedicalDetailsParameters);
  return Right(result);}
 on ServerException catch (failure)
 {
   return Left(ServerFailure(failure.errorMessageModel.message));
 }
  }
  @override
  Future<Either<Failure, MedicalDetailsEntity>> deleteMedicalDetails(DeleteMedicalDetailsParameters deleteMedicalDetailsParameters)async {
    try{ final  result= await baseRemoteDataSource.deleteMedicalDetails(deleteMedicalDetailsParameters);
    return Right(result );}
    on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, TestEntite>> createTest(FormData body) async{
    try{
      final result=await baseRemoteDataSource.createTest(body);
      return Right(result);

    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, List<DataTest>>> getAllTests(GetAllTestsParameters getAllTestsParameters)async {
    try{
      final result=await baseRemoteDataSource.getAllTests(getAllTestsParameters);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, TestEntite>> getTest(GetTestsParameters getTestsParameters)async {
    try{
      final result=await baseRemoteDataSource.getTest(getTestsParameters);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, TestEntite>> deleteTests(DeleteTestsParameters deleteTestsParameters)async {
    try{
      final result=await baseRemoteDataSource.deleteTests(deleteTestsParameters);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, PrescriptionEntite>> createPrescription(FormData body)async {
    try{
    final result=await baseRemoteDataSource.createPrescription(body);
    return Right(result);
    }
    on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}
  @override
  Future<Either<Failure, List<DataPrescription>>> getAllPrescription(GetAllPrescriptionParameters getAllPrescriptionParameters) async{
    try{
      final result=await baseRemoteDataSource.getAllPrescription(getAllPrescriptionParameters);
      return Right(result);
    }
    on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, PrescriptionEntite>> deletePrescription(DeletePrescriptionParameters deletePrescriptionParameters)async {
  try{  final result = await baseRemoteDataSource.deletePrescription(
        deletePrescriptionParameters);
  return Right(result);
  }on ServerException catch (failure)
  {
  return Left(ServerFailure(failure.errorMessageModel.message));
  }
  }
  @override
  Future<Either<Failure, PrescriptionEntite>> getPrescription(GetPrescriptionParameters getPrescriptionParameters)async {
    try{
      final result=await baseRemoteDataSource.getPrescription(getPrescriptionParameters);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }}