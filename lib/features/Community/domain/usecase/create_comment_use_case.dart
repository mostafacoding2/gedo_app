import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/comment_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
class CreateCommentUseCase extends BaseUseCase<CommentEntity,PostcommentParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  CreateCommentUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, CommentEntity>> call(PostcommentParameters parameters)async {
    return await baseRepositoryCommunity.createComment(parameters);
  }
}
class PostcommentParameters extends Equatable {
  final String id;
 final FormData formData;
   const PostcommentParameters(
     this.formData,
     this.id
   );
  @override
  List<Object?> get props => [id,formData];
}