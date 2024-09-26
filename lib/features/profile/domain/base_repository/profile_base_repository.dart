import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/profile/domain/entites/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
abstract class ProfileBaseRepository{
  Future<Either<Failure,ProfileEntity>>changeProfileData(FormData body);
  Future<Either<Failure,ProfileEntity>>changePassword(Map<String,dynamic> body);
}