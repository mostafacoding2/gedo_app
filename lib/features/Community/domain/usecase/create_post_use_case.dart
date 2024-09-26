import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/community_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class CreatePostUseCase extends BaseUseCase<CommunityEntity,FormData>{
 final BaseRepositoryCommunity baseRepositoryCommunity;
  CreatePostUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, CommunityEntity>> call(FormData parameters) async{
    return await baseRepositoryCommunity.createPost(parameters);
  }
}