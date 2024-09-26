import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/error/failure.dart';
import 'package:alzcare/features/Community/data/datasource/community_remote_data_source.dart';
import 'package:alzcare/features/Community/data/model/posts_model.dart';
import 'package:alzcare/features/Community/domain/base_repository/community_base_repository.dart';
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
class CommunityRepository extends BaseRepositoryCommunity{
  BaseRemoteDataSourceCommunity baseRemoteDataSourceCommunity;
  CommunityRepository(this.baseRemoteDataSourceCommunity);
  @override
  Future<Either<Failure, CommunityEntity>> createPost(FormData formData) async{
    try{
   final result=await baseRemoteDataSourceCommunity.createPost(formData);
   return Right(result);
  } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, List<DataPosts>>> getAllPosts()async {
    try{
      final result=await baseRemoteDataSourceCommunity.getAllPosts();
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}
  @override
  Future<Either<Failure, CommentEntity>> createComment(PostcommentParameters postcommentParameters)async {
    try{
      final result=await baseRemoteDataSourceCommunity.createComment(postcommentParameters);
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}
  @override
  Future<Either<Failure, List<DataPostsModel>>> getAllComment(GetAllCommentParameters getAllCommentParameters) async{
    try{
    final result=await baseRemoteDataSourceCommunity.getAllComment(getAllCommentParameters);
    return Right(result);
  }on ServerException catch (failure) {
  return Left(ServerFailure(failure.errorMessageModel.message));
  }}

  @override
  Future<Either<Failure, PostsEntity>> togglePostLikes(TogglePostLikesParameters togglePostLikesParameters) async{
    try{
      final result=await baseRemoteDataSourceCommunity.togglePostLikes(togglePostLikesParameters);
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}
  @override
  Future<Either<Failure, CommentEntity>> toggleCommentLikes(ToggleCommentLikesParameters toggleCommentLikesParameters) async{
    try{
      final result=await baseRemoteDataSourceCommunity.toggleCommentLikes(toggleCommentLikesParameters);
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}
  @override
  Future<Either<Failure, ChatEntity>> postMessage(PostMessageParameters postMessageParameters)async{
    try{
      final result=await baseRemoteDataSourceCommunity.postMessage(postMessageParameters);
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}
  @override
  Future<Either<Failure, List<ChatData>>> getAllMessages(GetAllMessageParameters getAllMessageParameters) async{
    try{
      final result=await baseRemoteDataSourceCommunity.getAllMessages(getAllMessageParameters);
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}

  @override
  Future<Either<Failure, List<DataPosts>>> getAllMyPosts(GetAllMyPostParameters getAllMyPostParameters)async {
    try {
      final result = await baseRemoteDataSourceCommunity.getAllMyPosts(
          getAllMyPostParameters);
      return Right(result);
    }
      on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}

  @override
  Future<Either<Failure, PostsEntity>> deletePost(DeletePostParameters deletePostParameters) async {
    try {
      final result = await baseRemoteDataSourceCommunity.deletePost(deletePostParameters);
      return Right(result);
    }
    on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }}


  @override
  Future<Either<Failure, List<NotificationEntity>>> getAllNotification()async {
   try{
     final result = await baseRemoteDataSourceCommunity.getAllNotifications();
     return Right(result);
   }on ServerException catch (failure) {
     return Left(ServerFailure(failure.errorMessageModel.message));
   }
  }
  @override
  Future<Either<Failure, NotificationEntity>> deleteAllNotification() async{try{
    final result = await baseRemoteDataSourceCommunity.deleteAllNotifications();
    return Right(result);
  }on ServerException catch (failure) {
    return Left(ServerFailure(failure.errorMessageModel.message));
  }
  }
}