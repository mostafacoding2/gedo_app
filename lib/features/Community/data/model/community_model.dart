import 'package:alzcare/features/Community/domain/entites/community_entity.dart';
class CommunityModel extends CommunityEntity {
  const CommunityModel(
      {required super.status,
      required super.code,
      required super.message,
      required super.data});
  factory CommunityModel.fromJson(Map<String, dynamic> json) => CommunityModel(
          status: json['status'],
          code: json['code'],
          message: json['message'],
          data:json['data']!=null&& json['data'] is Map<String,dynamic>?DataCommunityModel.fromJson(json['data']):null ,
  );
}
class DataCommunityModel extends DataCommunity {
  DataCommunityModel(
      {required super.text,
      required super.image,
      required super.user,
      required super.likes,
      required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.v});
  factory DataCommunityModel.fromJson(Map<String, dynamic> json)=>DataCommunityModel(
      text: json['text'],
      image: json['image']!=null&& json['image'] is Map<String,dynamic>?ImageModle.fromJson(json['image']):null ,
      user: json['user'],
      likes:json['likes']!=null? List<dynamic>.from(json['likes']):null,
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v']
  );
}
class ImageModle extends ImagePost {
  ImageModle({required super.url, required super.publicId});
  factory ImageModle.fromJson(Map<String, dynamic> json) =>
      ImageModle(url: json['url'], publicId: json['publicId']);
}
