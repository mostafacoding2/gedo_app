import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
import 'package:alzcare/features/Community/domain/entites/notifications_entity.dart';
import 'package:dartz/dartz.dart';
class GetAllNotificationUseCase  extends BaseUseCase<List<NotificationEntity> ,NoParameters>{
  BaseRepositoryCommunity baseRepositoryCommunity;
  GetAllNotificationUseCase(this.baseRepositoryCommunity);
  @override
  Future<Either<Failure, List<NotificationEntity>>> call(NoParameters parameters)async {
    return await baseRepositoryCommunity.getAllNotification();
  }
}