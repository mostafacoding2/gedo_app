import 'package:alzcare/features/Community/data/model/community_model.dart';
import 'package:alzcare/features/Community/domain/entites/comment_entity.dart';
class CommentModel extends CommentEntity {
  CommentModel(
      {required super.status,
      required super.code,
      required super.message,
      required super.data});
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      CommentModel(
          status: json['status'],
          code: json['code'],
          message: json['message'],
        data: json['data'] != null && json['data'] is Map<String, dynamic>
            ? DataCommentModel.fromJson(json['data'])
            : null,      );
}
class DataCommentModel extends DataComment {
  DataCommentModel(
      {required super.postId,
      required super.user,
      required super.image,
      required super.text,
      required super.likes,
      required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.v});
  factory DataCommentModel.fromJson(Map<String, dynamic> json) =>
      DataCommentModel(
          postId: json['postId'],
          user: json['user'],
          image: json['image'] != null && json['image'] is Map<String, dynamic>
              ? ImageModle.fromJson(json['image'])
              : null,
          text: json['text'],
          likes: json['likes'] != null ? List<dynamic>.from(json['likes']) : null,
          id: json['_id'],
          createdAt: json['createdAt'],
          updatedAt: json['updatedAt'],
          v: json['__v']
      );
}