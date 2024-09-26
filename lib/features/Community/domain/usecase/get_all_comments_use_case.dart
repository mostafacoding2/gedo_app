import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class GetAllCommentUseCase extends BaseUseCase<List<DataPosts>,GetAllCommentParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  GetAllCommentUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, List<DataPosts>>> call(GetAllCommentParameters parameters)async {
  return await baseRepositoryCommunity.getAllComment(parameters);
  }}
class GetAllCommentParameters extends Equatable {
  final String id;
  const GetAllCommentParameters(
      this.id
      );
  @override
  List<Object?> get props => [id,];
}