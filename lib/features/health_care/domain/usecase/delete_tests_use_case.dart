import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/test_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class DeleteTestsUseCase extends BaseUseCase<TestEntite,DeleteTestsParameters>{
  BaseRepository baseRepository;
  DeleteTestsUseCase(this.baseRepository);
  @override
  Future<Either<Failure, TestEntite>> call(DeleteTestsParameters parameters) async{
  return await baseRepository.deleteTests(parameters);
  }
}
 class DeleteTestsParameters extends Equatable{
  final String id;
  const DeleteTestsParameters({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
 }