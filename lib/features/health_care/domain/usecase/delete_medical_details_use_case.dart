import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:alzcare/features/health_care/domain/entites/medical%20details_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

class DeleteMedicalDetailsUseCase
    extends BaseUseCase< MedicalDetailsEntity,DeleteMedicalDetailsParameters > {
  BaseRepository baseRepository;

  DeleteMedicalDetailsUseCase(this.baseRepository);
  @override
  Future<Either<Failure, MedicalDetailsEntity>> call( DeleteMedicalDetailsParameters deleteMedicalDetailsParameters) async {
    return await baseRepository.deleteMedicalDetails(deleteMedicalDetailsParameters);
  }
}
class DeleteMedicalDetailsParameters extends Equatable {
  final String id;
  const DeleteMedicalDetailsParameters({ required this.id});
  @override
  List<Object> get props => [id];
}