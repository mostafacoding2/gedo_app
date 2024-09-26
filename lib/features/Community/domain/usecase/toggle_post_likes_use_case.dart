import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class TogglePostLikesUseCase extends  BaseUseCase<PostsEntity,TogglePostLikesParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  TogglePostLikesUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, PostsEntity>> call(TogglePostLikesParameters parameters)async  {
    return await baseRepositoryCommunity.togglePostLikes(parameters);
  }
}
class TogglePostLikesParameters extends Equatable {
  final String id;
  const TogglePostLikesParameters(
      this.id
      );
  @override
  List<Object?> get props => [id,];
}