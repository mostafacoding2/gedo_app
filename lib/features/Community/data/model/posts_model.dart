import 'package:alzcare/features/Community/data/model/community_model.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:alzcare/features/profile/data/model/Profile%20model.dart';
class PostsModel extends PostsEntity {
  const PostsModel(
      {required super.status,
      required super.code,
      required super.message,
      required super.data});
  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      PostsModel(
        status: json['status'],
        code: json['code'],
        message: json['message'],
        data: json['data'] != null&& json['data']is Map<String,dynamic>?DataPostsModel.fromJson(json['data']):null
      );
}
class DataPostsModel extends DataPosts {
  const DataPostsModel(
      {required super.commentCount,
        required super.id,
      required super.text,
      required super.image,
      required super.user,
      required super.likes,
      required super.createdAt,
      required super.updatedAt,
      required super.v});
  factory DataPostsModel.fromJson(Map<String, dynamic> json) => DataPostsModel(
      id: json['_id'],
      text: json['text'],
      image: json['image'] != null && json['image'] is Map<String, dynamic>
          ? ImageModle.fromJson(json['image'])
          : null,
      user: json['user']!= null &&
      json['user'] is Map<String, dynamic>
      ? UserPostsModel.fromJson(json['user'])
      : null,
      likes: json['likes'] != null ? List<dynamic>.from(json['likes']) : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      commentCount: json['commentCount'],
      v: json['v']);
}
class UserPostsModel extends UserPosts {
  const UserPostsModel(
      {required super.uname,
      required super.profileImg,
      required super.patientCode,
      required super.mail,
      required super.userType,
      required super.remindersAndTasks,
      required super.patients,
      required super.createdAt,
      required super.updatedAt,
      required super.id});
  factory UserPostsModel.fromJson(Map<String, dynamic> json) => UserPostsModel(
      uname: json['Uname'],
      profileImg: json['profileImg'] != null &&
              json['profileImg'] is Map<String, dynamic>
          ? ProfileImageModel.fromJson(json['profileImg'])
          : null,
      patientCode: json['patientCode'],
      mail: json['mail'],
      userType: json['userType'],
      remindersAndTasks: json['remindersAndTasks'],
      patients: json['patients'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id']);
}
