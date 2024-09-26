import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/authentication/domain/base_repository/auth%20base%20repository.dart';
import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase extends BaseUseCase<UserEntity , String>
{
  final AuthBaseRepository authBaseRepository;

  ForgetPasswordUseCase(this.authBaseRepository);

  @override
  Future<Either<Failure, UserEntity>> call(String email)async
  {
    return await authBaseRepository.forgetPassword(email);
  }
}