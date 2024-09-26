import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
import 'package:alzcare/features/authentication/domain/usecase/reset_password.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../domain/base_repository/auth base repository.dart';
import '../datasource/auth_data_source.dart';
class AuthRepository extends AuthBaseRepository {
  final AuthBaseRemoteDataSource authBaseRemoteDataSource;
  AuthRepository(this.authBaseRemoteDataSource);


  @override
  Future<Either<Failure, UserEntity>> patientRegister(
      Map<String, dynamic> body) async {
    try {
      final result = await authBaseRemoteDataSource.patientRegister(body);
      return const Right(UserEntity(token: '', message: 'message', statusCode: 'statusCode', data: null));
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }


  @override
  Future<Either<Failure, UserEntity>> careGiverRegister(Map<String, dynamic> body)async {
    try {
      final result = await authBaseRemoteDataSource.careGiverRegister(body);
      return const Right(UserEntity(token: '', message: 'message', statusCode: 'statusCode', data: null));
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> login(Map<String, dynamic> body)
  async {
    try {
      final result = await authBaseRemoteDataSource.login(body);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> forgetPassword(String email)async
  {
    try {
      final result = await authBaseRemoteDataSource.forgetPassword(email);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> resetPassword(ResetPasswordParameters resetPasswordParameters) async
  {
    try {
      final result = await authBaseRemoteDataSource.resetPassword(resetPasswordParameters);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyCode(Map<String, dynamic> parameters) async
  {
    try {
      final result = await authBaseRemoteDataSource.verifyCode(parameters);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async
  {
    try {
      final result = await authBaseRemoteDataSource.getCurrentUser();
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
