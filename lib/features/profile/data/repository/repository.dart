import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:alzcare/features/profile/domain/base_repository/profile_base_repository.dart';
import 'package:alzcare/features/profile/domain/entites/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class Repository extends ProfileBaseRepository{
  BaseProfileRemoteDataSource baseProfileRemoteDataSource;
  Repository(this.baseProfileRemoteDataSource);
  @override
  Future<Either<Failure, ProfileEntity>> changeProfileData( FormData body)async {
    try{final result=await baseProfileRemoteDataSource.changeProfileImage( body);
   return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, ProfileEntity>> changePassword(Map<String, dynamic> body) async{
    try{
      final result=await baseProfileRemoteDataSource.changePassword( body);
    return Right(result);
    }
    on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  }
