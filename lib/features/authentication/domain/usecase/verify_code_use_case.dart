import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/authentication/domain/base_repository/auth%20base%20repository.dart';
import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';


class VerifyCodeUseCase extends BaseUseCase<UserEntity , Map<String , dynamic>>
{
  final AuthBaseRepository authBaseRepository;

  VerifyCodeUseCase(this.authBaseRepository);

  @override
  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> parameters)async
  {
    return await authBaseRepository.verifyCode(parameters);
  }
}