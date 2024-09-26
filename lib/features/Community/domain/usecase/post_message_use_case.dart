import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/chat_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
class PostMessageUseCase extends BaseUseCase<ChatEntity,PostMessageParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  PostMessageUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, ChatEntity>> call(PostMessageParameters parameters)async {
    return await baseRepositoryCommunity.postMessage(parameters);
  }
}
class PostMessageParameters extends Equatable {
  final String id;
  final FormData formData;
  const PostMessageParameters(
      this.formData,
      this.id
      );
  @override
  List<Object?> get props => [id,formData];
}