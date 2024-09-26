import 'package:equatable/equatable.dart';
class CommunityEntity extends Equatable {
  final String? status;
  final int? code;
  final String? message;
  final DataCommunity? data;
  const CommunityEntity(
      {required this.status,
      required this.code,
      required this.message,
      required this.data});
  @override
  List<Object?> get props => [status, code, message, data];
}
class DataCommunity extends Equatable {
  final String? text;
  final ImagePost? image;
  final String? user;
  final List<dynamic>? likes;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  const DataCommunity(
      {required this.text,
      required this.image,
      required this.user,
      required this.likes,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.v});
  @override
  List<Object?> get props => [
        text,
        image,
        user,
        likes,
        id,
        createdAt,
        updatedAt,
        v,
      ];
}
class ImagePost extends Equatable {
  final String? url;
  final String? publicId;
  const ImagePost({required this.url, required this.publicId});
  @override
  List<Object?> get props => [url, publicId];
}
