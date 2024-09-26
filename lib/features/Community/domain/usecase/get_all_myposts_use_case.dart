import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class GetAllMyPostUsecase  extends BaseUseCase<List<DataPosts> ,GetAllMyPostParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  GetAllMyPostUsecase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, List<DataPosts>>> call(GetAllMyPostParameters parameters)async {
    return await baseRepositoryCommunity.getAllMyPosts(parameters);
  }
}
class GetAllMyPostParameters extends Equatable {
  final String id;
  const GetAllMyPostParameters(
      this.id
      );
  @override
  List<Object?> get props => [id,];
}