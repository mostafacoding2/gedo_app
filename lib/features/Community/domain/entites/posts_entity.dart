import 'package:alzcare/features/Community/domain/entites/community_entity.dart';
import 'package:alzcare/features/profile/domain/entites/profile_entity.dart';
import 'package:equatable/equatable.dart';
class PostsEntity extends Equatable {
  final String? status;
  final int? code;
  final String? message;
 final DataPosts? data;
  const PostsEntity({
    required this.data,
    required this.status,
    required this.code,
    required this.message,
   });
  @override
  List<Object?> get props => [status, code, message, data];
}
class DataPosts extends Equatable {

  final String? id;
  final int? commentCount;
  final String? text;
  final ImagePost? image;
  final UserPosts? user;
  final List<dynamic>? likes;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  const DataPosts( {required this.commentCount,required this.id,
    required this.text,
    required this.image,
    required this.user,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.v});
  @override
  List<Object?> get props =>
      [commentCount,
        id,
        text,
        image,
        user,
        likes,
        createdAt,
        updatedAt,
        v,
      ];
}
class UserPosts extends Equatable {
  final String? uname;
  final ProfileImage? profileImg;
  final String? patientCode;
  final String? mail;
  final int? userType;
  final List<dynamic>? remindersAndTasks;
  final List<dynamic>? patients;
  final String? createdAt;
  final String? updatedAt;
  final String? id;

  const UserPosts({required this.uname,
    required this.profileImg,
    required this.patientCode,
    required this.mail,
    required this.userType,
    required this.remindersAndTasks,
    required this.patients,
    required this.createdAt,
    required this.updatedAt,
    required this.id});

  @override
  List<Object?> get props =>
      [
        uname,
        profileImg,
        patientCode,
        mail,
        userType,
        remindersAndTasks,
        patients,
        createdAt,
        updatedAt,
        id,
      ];
}
