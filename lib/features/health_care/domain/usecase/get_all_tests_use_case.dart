import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/test_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class GetAllTestsUseCase extends BaseUseCase<List<DataTest>,GetAllTestsParameters>{
  BaseRepository baseRepository;
  GetAllTestsUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<DataTest>>> call(GetAllTestsParameters getAllTestsParameters)async {
   return await baseRepository.getAllTests(getAllTestsParameters);
  }
}
class GetAllTestsParameters extends Equatable {
  final String id;
  const GetAllTestsParameters({ required this.id});
  @override
  List<Object> get props => [id];
}