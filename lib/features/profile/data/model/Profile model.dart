import 'package:alzcare/features/profile/domain/entites/profile_entity.dart';

class ProfileModel extends ProfileEntity{
  ProfileModel({required super.status, required super.code, required super.message, required super.data});
 factory ProfileModel.fromJson(Map<String, dynamic> json)=>ProfileModel(
     status:json['status'],
     code: json['code'], message: json['message'],
     data: json['data'] != null && json['data'] is Map<String, dynamic> ? DataProfileModel.fromJson(json['data']) : null,
  );
}
class DataProfileModel extends DataProfile{
  DataProfileModel({
    required super.uname,
    required super.profileImage,
    required super.patientCode,
    required super.mail,
    required super.userType,
    required super.id});
  factory DataProfileModel.fromJson(Map<String, dynamic> json)=>DataProfileModel(
      uname: json['Uname'],
      profileImage: json['profileImg'] != null && json['profileImg'] is Map<String, dynamic> ? ProfileImageModel.fromJson(json['profileImg']) : null,
      patientCode:json['patientCode'],
      mail: json['mail'],
      userType:json['userType'],
      id: json['id']
  );
}
class ProfileImageModel extends ProfileImage{
  ProfileImageModel({required super.url, required super.publicId});
 factory ProfileImageModel.fromJson(Map<String, dynamic> json)=>
      ProfileImageModel(url:json['url'], publicId: json['publicId']);
}