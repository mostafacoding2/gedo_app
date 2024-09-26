import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/domain/entites/chat_entity.dart';
import 'package:alzcare/features/Community/domain/entites/comment_entity.dart';
import 'package:alzcare/features/Community/domain/entites/community_entity.dart';
import 'package:alzcare/features/Community/domain/entites/notifications_entity.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:alzcare/features/Community/domain/usecase/create_comment_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/delete_post_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_comments_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_myposts_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/post_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_comment_likes_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_post_likes_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
abstract class BaseRepositoryCommunity
{
  Future<Either<Failure,CommunityEntity>>createPost(FormData formData);
  Future<Either<Failure,List<DataPosts>>>getAllPosts( );
  Future<Either<Failure,CommentEntity>>createComment(PostcommentParameters postcommentParameters);
 Future<Either<Failure,List<DataPosts>>> getAllComment(GetAllCommentParameters getAllCommentParameters);
  Future<Either<Failure,PostsEntity>> togglePostLikes(TogglePostLikesParameters togglePostLikesParameters);
  Future<Either<Failure,CommentEntity>> toggleCommentLikes(ToggleCommentLikesParameters toggleCommentLikesParameters);
  Future<Either<Failure,ChatEntity>>postMessage(PostMessageParameters postMessageParameters);
  Future<Either<Failure,List<ChatData>>>getAllMessages(GetAllMessageParameters getAllMessageParameters);
  Future<Either<Failure,List<DataPosts>>>getAllMyPosts(GetAllMyPostParameters getAllMyPostParameters );
  Future<Either<Failure,PostsEntity>>deletePost(DeletePostParameters deletePostParameters );
  Future<Either<Failure,List<NotificationEntity>>>getAllNotification();
  Future<Either<Failure,NotificationEntity>>deleteAllNotification();
}