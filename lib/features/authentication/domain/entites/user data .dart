import 'package:equatable/equatable.dart';
class UserEntity extends Equatable {
  final String? token;
  final String? userId;
  final String? message;
  final String? statusCode;
  final Data? data;
  const UserEntity(
      {
        required this.token,
      required this.message,
      required this.statusCode,
       this.userId,
        required this.data,
     });

  @override
  List<Object?> get props =>
      [
        token,
        message,
        statusCode,
        data,
        userId,
      ];
}
class Data extends Equatable
{final ProfileImg ?profileImg;
  final String? userId;
  final String? userName;
  final List? patientsId;
  final int? userType;
  final String? userEmail;
  final String? phone;
  final String? patientCode;
  final String? createdAt;
  final String? updatedAt;
  final CareGiverID ? careGiverID;

  const Data(
      {        required this.careGiverID,

        required this.profileImg,
        required this.userId,
        required this.userName,
        required this.userType,
        required this.userEmail,
        required this.patientCode,
        required this.phone,
        required this.patientsId,
        required this.createdAt,
        required this.updatedAt,
      });
  @override
  List<Object?> get props =>
      [
        userId,
        userName,
        userType,
        userEmail,
        patientCode,
        createdAt,
        updatedAt,
        phone,
        patientsId,
        careGiverID
      ];
}
class CareGiverID extends Equatable {
  final String ?idcareGiver;
  final String ?usernamecareGiver;
  final ProfileImg ?profileImg;
  const CareGiverID({
    required this.profileImg,
    required this.idcareGiver,
    required this.usernamecareGiver,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [idcareGiver,usernamecareGiver,profileImg];
}
class ProfileImg extends Equatable {
  final String ?url;
  final String ?publicId;
  const ProfileImg({
    required this.url,
    required this.publicId,
  });
  @override
  List<Object?> get props => [url, publicId];
}
