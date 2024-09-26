import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/base_repository/base%20repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entites/medical details_entity.dart';
class GetMedicalDetailsUseCase extends BaseUseCase<List<DataMedical>,GetAllMedicalDetailsParameters>{
  BaseRepository baseRepository;
  GetMedicalDetailsUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<DataMedical>>> call(GetAllMedicalDetailsParameters getAllMedicalDetailsParameters) async{
    return await baseRepository.getAllMedicalDetails(getAllMedicalDetailsParameters);
  }
}
class GetAllMedicalDetailsParameters extends Equatable {
  final String id;
  const GetAllMedicalDetailsParameters({ required this.id});
  @override
  List<Object> get props => [id];
}

