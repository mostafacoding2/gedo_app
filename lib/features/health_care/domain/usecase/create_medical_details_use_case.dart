import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/medical%20details_entity.dart';
import 'package:dartz/dartz.dart';
class PostMedicalDetailsUseCase extends BaseUseCase<MedicalDetailsEntity , Map<String , dynamic>>{
  final BaseRepository baseRepository;
   PostMedicalDetailsUseCase(this.baseRepository);
  @override
  Future<Either<Failure, MedicalDetailsEntity>> call(Map<String, dynamic> parameters)async {
    return await baseRepository.createMedicalDetails(parameters);
  }
}