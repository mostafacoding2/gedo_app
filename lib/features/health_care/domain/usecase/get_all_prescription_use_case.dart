import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class GetAllPrescriptionUseCase extends BaseUseCase<List<DataPrescription>,GetAllPrescriptionParameters>
{
  BaseRepository baseRepository;
  GetAllPrescriptionUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<DataPrescription>>> call(GetAllPrescriptionParameters parameters)async {
   return await baseRepository.getAllPrescription(parameters);
  }
}
class GetAllPrescriptionParameters extends Equatable {
  final String id;
  const GetAllPrescriptionParameters({required this.id});
  @override
  List<Object?> get props => [id];
}