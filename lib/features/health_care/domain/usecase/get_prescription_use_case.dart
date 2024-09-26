import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
class GetPrescriptionUseCase extends BaseUseCase<PrescriptionEntite,GetPrescriptionParameters>{
  BaseRepository baseRepository;
  GetPrescriptionUseCase(this.baseRepository);
  @override
  Future<Either<Failure, PrescriptionEntite>> call(GetPrescriptionParameters parameters) async{
    return await  baseRepository.getPrescription(parameters);
  }}
class GetPrescriptionParameters extends Equatable {
  final String id;
  const GetPrescriptionParameters({required this.id});
  @override
  List<Object?> get props => [id];
}