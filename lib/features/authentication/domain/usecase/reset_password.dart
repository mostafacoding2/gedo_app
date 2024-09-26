import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/authentication/domain/base_repository/auth%20base%20repository.dart';
import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/base_use_case/base_use_case.dart';

class ResetPasswordUseCase
    extends BaseUseCase<UserEntity, ResetPasswordParameters> {
  final AuthBaseRepository authBaseRepository;

  ResetPasswordUseCase(this.authBaseRepository);

  @override
  Future<Either<Failure, UserEntity>> call(
      ResetPasswordParameters resetPasswordParameters) async
  {
    return await authBaseRepository.resetPassword(resetPasswordParameters);
  }
}

class ResetPasswordParameters extends Equatable {
  final String password;
  final String userId;

  const ResetPasswordParameters({required this.password, required this.userId});

  @override
  List<Object> get props => [password, userId];
}