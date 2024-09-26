import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class DeletePrescriptionUseCase extends BaseUseCase<PrescriptionEntite,DeletePrescriptionParameters>{
BaseRepository baseRepository;
DeletePrescriptionUseCase(this.baseRepository);
  @override
  Future<Either<Failure, PrescriptionEntite>> call(DeletePrescriptionParameters parameters) async{
    return await baseRepository.deletePrescription(parameters);
  }
}
class DeletePrescriptionParameters extends Equatable {
  final String id;
  const DeletePrescriptionParameters({required this.id});
  @override
  List<Object?> get props => [id];
}
