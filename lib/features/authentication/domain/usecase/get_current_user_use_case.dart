import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/authentication/domain/base_repository/auth%20base%20repository.dart';
import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
import 'package:dartz/dartz.dart';
class GetCurrentUserUseCase extends BaseUseCase<UserEntity , NoParameters>
{
   AuthBaseRepository authBaseRepository;
   GetCurrentUserUseCase(this.authBaseRepository);
  @override
  Future<Either<Failure, UserEntity>> call( NoParameters parameters)async
  {
    return await authBaseRepository.getCurrentUser();
  }
}