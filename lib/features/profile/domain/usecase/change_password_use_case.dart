import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/profile/domain/base_repository/profile_base_repository.dart';
import 'package:alzcare/features/profile/domain/entites/profile_entity.dart';
import 'package:dartz/dartz.dart';
class ChangePasswordUseCase extends BaseUseCase<ProfileEntity,Map <String,dynamic>>{
  ProfileBaseRepository profileBaseRepository;
  ChangePasswordUseCase(this.profileBaseRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(Map <String,dynamic> parameters) async{
    return await profileBaseRepository.changePassword(parameters);
  }
}