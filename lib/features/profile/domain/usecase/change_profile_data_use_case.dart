import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/profile/domain/base_repository/profile_base_repository.dart';
import 'package:alzcare/features/profile/domain/entites/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class ChangeprofiledataUseCase extends BaseUseCase<ProfileEntity,FormData>{
  ProfileBaseRepository profileBaseRepository;
  ChangeprofiledataUseCase(this.profileBaseRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(FormData parameters) async{
   return await profileBaseRepository.changeProfileData(parameters);
  }
}