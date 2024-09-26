import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/health_care/domain/entites/medical%20details_entity.dart';
import 'package:alzcare/features/health_care/domain/entites/prescription_entity.dart';
import 'package:alzcare/features/health_care/domain/entites/test_entity.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/delete_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_medical_details_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_all_tests_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_prescription_use_case.dart';
import 'package:alzcare/features/health_care/domain/usecase/get_test_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
abstract class BaseRepository {
  Future<Either<Failure, MedicalDetailsEntity>> createMedicalDetails(Map<String, dynamic> body);
  Future<Either<Failure, List<DataMedical>>> getAllMedicalDetails(GetAllMedicalDetailsParameters getAllMedicalDetailsParameters);
  Future<Either<Failure, MedicalDetailsEntity>> deleteMedicalDetails(DeleteMedicalDetailsParameters deleteMedicalDetailsParameters);
  Future<Either<Failure, TestEntite>> createTest( FormData body);
 Future<Either<Failure,List<DataTest>>>getAllTests(GetAllTestsParameters getAllTestsParameters);
Future<Either<Failure,TestEntite>>getTest(GetTestsParameters getTestsParameters);
  Future<Either<Failure, TestEntite>> deleteTests(DeleteTestsParameters deleteTestsParameters);
  Future<Either<Failure, PrescriptionEntite>> createPrescription( FormData body);
  Future<Either<Failure,List<DataPrescription>>>getAllPrescription(GetAllPrescriptionParameters getAllPrescriptionParameters);
  Future<Either<Failure, PrescriptionEntite>> deletePrescription(DeletePrescriptionParameters deletePrescriptionParameters);
  Future<Either<Failure,PrescriptionEntite>>getPrescription(GetPrescriptionParameters getPrescriptionParameters);
}