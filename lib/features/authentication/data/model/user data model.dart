import 'package:alzcare/features/authentication/domain/entites/user%20data%20.dart';
class UserModel extends UserEntity {
  UserModel({
    required super.token,
    required super.message,
    required super.statusCode,
    required super.userId,
    super.data,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json['data'] != null ? json['data']['token'] : null,
        userId: json['data'] != null ? json['data']['id'] : null,
        message: json['message'],
        statusCode: json['status'],
        data: json['data']['user'] != null ?  DataModel.fromJson(json['data']['user'] ) :json['data'] != null ? DataModel.fromJson(json['data'] ): null ,
      );
}
class DataModel extends Data {
  DataModel({required super.careGiverID,
    required super.profileImg,
    required super.userId,
    required super.userName,
    required super.userType,
    required super.userEmail,
    required super.patientCode,
    required super.createdAt,
    required super.updatedAt,
    required super.phone,
    required super.patientsId,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    careGiverID: json['careGiver_ID'] != null && json['careGiver_ID'] is Map<String, dynamic> ? CareGiverIDModel.fromJson(json['careGiver_ID']) : null,
    profileImg: json['profileImg'] != null && json['profileImg'] is Map<String, dynamic> ? ProfileImgModel.fromJson(json['profileImg']) : null,
    userId: json['id'],
    userName: json['Uname'],
    userType: json['userType'],
    userEmail: json['mail'],
    patientCode: json['patientCode'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    patientsId: json['patients'] ?? [],
    phone: json['phone'],
      );
}
class CareGiverIDModel extends CareGiverID{
  CareGiverIDModel({required super.profileImg, required super.idcareGiver, required super.usernamecareGiver});
  factory CareGiverIDModel.fromJson(Map<String, dynamic> json)=>CareGiverIDModel(
      profileImg: json['profileImg'] != null && json['profileImg'] is Map<String, dynamic> ? ProfileImgModel.fromJson(json['profileImg']) : null,
      idcareGiver: json['_id'],
      usernamecareGiver: json['Uname']
  );

}
class ProfileImgModel extends ProfileImg{
  ProfileImgModel({required super.url, required super.publicId});
  factory ProfileImgModel.fromJson(Map<String, dynamic> json)=>
      ProfileImgModel(url:json['url'], publicId: json['publicId']);
}