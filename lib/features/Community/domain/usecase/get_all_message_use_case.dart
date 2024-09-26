import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/chat_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class GetAlMessagesChatUseCase extends BaseUseCase<List<ChatData>,GetAllMessageParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  GetAlMessagesChatUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, List<ChatData>>> call(GetAllMessageParameters parameters) async{
    return await baseRepositoryCommunity.getAllMessages(parameters); }
}
class GetAllMessageParameters extends Equatable {
  final String id;
  const GetAllMessageParameters(
      this.id
      );
  @override
  List<Object?> get props => [id,];
}