import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PostPrescriptionUseCase extends BaseUseCase<PrescriptionEntite,FormData>{
  BaseRepository baseRepository;
  PostPrescriptionUseCase(this.baseRepository);
  @override
  Future<Either<Failure, PrescriptionEntite>> call(FormData parameters)async {
    return await baseRepository.createPrescription(parameters);
  }


}