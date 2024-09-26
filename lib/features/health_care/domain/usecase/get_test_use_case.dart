import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/test_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
 class GetTestUseCase extends BaseUseCase<TestEntite,GetTestsParameters>{
   BaseRepository baseRepository;
   GetTestUseCase(this.baseRepository);
  @override
  Future<Either<Failure, TestEntite>> call(GetTestsParameters parameters) async{
    return await baseRepository.getTest(parameters);
  }
 }
class GetTestsParameters extends Equatable {
  final String id;
  const GetTestsParameters({ required this.id});
  @override
  List<Object> get props => [id];
}