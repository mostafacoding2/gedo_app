import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class DeletePostUsecase  extends BaseUseCase<PostsEntity ,DeletePostParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  DeletePostUsecase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, PostsEntity>> call(DeletePostParameters parameters)async {
    return await baseRepositoryCommunity.deletePost(parameters);
  }
}
class DeletePostParameters extends Equatable {
  final String id;
  const DeletePostParameters(
      this.id
      );
  @override
  List<Object?> get props => [id,];
}