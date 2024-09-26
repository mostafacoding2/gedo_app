import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/comment_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class ToggleCommentLikesUseCase extends  BaseUseCase<CommentEntity,ToggleCommentLikesParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  ToggleCommentLikesUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, CommentEntity>> call(ToggleCommentLikesParameters parameters)async  {
    return await baseRepositoryCommunity.toggleCommentLikes(parameters);
  }
}
class ToggleCommentLikesParameters extends Equatable {
  final String id;
  const ToggleCommentLikesParameters(
      this.id
      );
  @override
  List<Object?> get props => [id,];
}