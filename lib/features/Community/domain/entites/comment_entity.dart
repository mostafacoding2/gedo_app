import 'package:alzcare/features/Community/domain/entites/community_entity.dart';
import 'package:equatable/equatable.dart';
class CommentEntity  extends Equatable{
  final String? status;
  final int? code;
  final String? message;
  final DataComment? data;
  const CommentEntity(
      {required this.status, required this.code, required this.message, required this.data});
  @override
  List<Object?> get props => [status, code, message, data];
}
class DataComment extends Equatable {
  final String? postId;
  final String? user;
  final ImagePost? image;
  final String? text;
  final List<dynamic>? likes;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  const DataComment({
    required this.postId,
    required this.user,
    required this.image,
    required this.text,
    required this.likes,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v});
  @override
  List<Object?> get props =>
      [postId, user, image, text, likes, id, createdAt, updatedAt, v,];
}