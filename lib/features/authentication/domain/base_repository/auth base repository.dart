import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
import 'package:alzcare/features/authentication/domain/usecase/reset_password.dart';
import 'package:dartz/dartz.dart';
abstract class AuthBaseRepository
{
  Future<Either<Failure, UserEntity>> patientRegister(Map<String , dynamic> body);
  Future<Either<Failure, UserEntity>> careGiverRegister(Map<String , dynamic> body);
  Future<Either<Failure, UserEntity>> login(Map<String , dynamic> body);
  Future<Either<Failure, UserEntity>> forgetPassword(String email);
  Future<Either<Failure, UserEntity>> verifyCode(Map<String , dynamic> parameters);
  Future<Either<Failure, UserEntity>> resetPassword(ResetPasswordParameters resetPasswordParameters);
  Future<Either<Failure,UserEntity>>getCurrentUser();
}