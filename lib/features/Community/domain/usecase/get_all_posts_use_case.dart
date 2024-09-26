import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:dartz/dartz.dart';
class GetAllPostUsecase  extends BaseUseCase<List<DataPosts> ,NoParameters>{
   BaseRepositoryCommunity baseRepositoryCommunity;
   GetAllPostUsecase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, List<DataPosts>>> call(NoParameters parameters)async {
  return await baseRepositoryCommunity.getAllPosts();
  }
}