import 'package:alzcare/core/error/exception.dart';
import 'package:alzcare/core/network/api_constant.dart';
import 'package:alzcare/core/network/error_message_model.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/dio_helper.dart';
import 'package:alzcare/features/Community/data/model/chat_model.dart';
import 'package:alzcare/features/Community/data/model/comment_model.dart';
import 'package:alzcare/features/Community/data/model/community_model.dart';
import 'package:alzcare/features/Community/data/model/notifications_model.dart';
import 'package:alzcare/features/Community/data/model/posts_model.dart';
import 'package:alzcare/features/Community/domain/usecase/create_comment_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/delete_post_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_comments_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_myposts_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/post_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_comment_likes_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_post_likes_use_case.dart';
import 'package:dio/dio.dart';
abstract class BaseRemoteDataSourceCommunity {
Future<CommunityModel>createPost(FormData formData);
Future <List<DataPostsModel>>getAllPosts();
Future <List<DataPostsModel>>getAllMyPosts(GetAllMyPostParameters getAllMyPostParameters);
Future<CommentModel>createComment(PostcommentParameters postcommentParameters);
Future<List<DataPostsModel>> getAllComment( GetAllCommentParameters getAllCommentParameters);
Future<PostsModel> togglePostLikes( TogglePostLikesParameters togglePostLikesParameters);
Future<CommentModel> toggleCommentLikes( ToggleCommentLikesParameters toggleCommentLikesParameters);
Future<ChatModel>postMessage(PostMessageParameters postMessageParameters);
Future<List<ChatDataModel>>getAllMessages(GetAllMessageParameters getAllMessageParameters);
Future<PostsModel>deletePost(DeletePostParameters deletePostParameters);
Future <List<NotificationsModel>>getAllNotifications();
Future <NotificationsModel>deleteAllNotifications();

}
class CommunityRemoteDataSource extends BaseRemoteDataSourceCommunity{
  @override
  Future<CommunityModel> createPost(FormData formData) async{
    try{
   final response=await DioHelper.postData(
       token: token,
       url: ApiConstant.createpost,
       data: formData);
   return CommunityModel.fromJson(response.data);
  }
  on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<List<DataPostsModel>> getAllPosts()async {
    try {
      List<DataPostsModel> tests=[];
      final response = await DioHelper.getData(
        bearerToken: token,
        url: ApiConstant.getallposts,
      );
      if (response.data['data'] is List<dynamic>) {
        // Convert each element in the list to DataTestModel
        tests = (response.data['data'] as List<dynamic>)
            .map((e) => DataPostsModel.fromJson(e))
            .toList();
        return tests;
      }  return tests;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<CommentModel> createComment(PostcommentParameters postcommentParameters) async{
    try{
      final response=await DioHelper.postData(
data: postcommentParameters.formData,
          token: token,
          url: ApiConstant.postcomment(postcommentParameters.id),
          );
      return CommentModel.fromJson(response.data);
    }
    on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<List<DataPostsModel>> getAllComment(GetAllCommentParameters getAllCommentParameters) async {
    try {
      List<DataPostsModel> tests=[];
      final response = await DioHelper.getData(
        bearerToken: token,
        url: ApiConstant.getallcomment(getAllCommentParameters.id),
      );
      if (response.data['data'] is List<dynamic>) {
        // Convert each element in the list to DataTestModel
        tests = (response.data['data'] as List<dynamic>)
            .map((e) => DataPostsModel.fromJson(e))
            .toList();
        return tests;
      }
        return tests;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<PostsModel> togglePostLikes(TogglePostLikesParameters togglePostLikesParameters)async {
    try{
  final response=await DioHelper.putData(url: ApiConstant.togglepostlikes(togglePostLikesParameters.id),token: token);
  return PostsModel.fromJson(response.data);
    }
    on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<CommentModel> toggleCommentLikes(ToggleCommentLikesParameters toggleCommentLikesParameters) async {
    try{
      final response=await DioHelper.putData(url: ApiConstant.togglecommentlikes(toggleCommentLikesParameters.id),token: token);
      return CommentModel.fromJson(response.data);
    }
    on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }

  @override
  Future<ChatModel> postMessage(PostMessageParameters postMessageParameters)  async{
    try{

      final response=await DioHelper.postData(query:({
        'recipientId':postMessageParameters.id

      }),
          token: token,
          url: ApiConstant.postmessage("663cba361edf3d2341e6991e"),
          data: postMessageParameters.formData);
      return ChatModel.fromJson(response.data);
    }
    on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }


  @override
  Future<List<ChatDataModel>> getAllMessages(GetAllMessageParameters getAllMessageParameters)async {
    try {
      List<ChatDataModel> tests=[];
      final response = await DioHelper.getData(query:({
        'recipientId':getAllMessageParameters.id
      }),
        bearerToken: token,
        url: ApiConstant.getallmessages(getAllMessageParameters.id),
      );
      if (response.data['data'] is List<dynamic>) {
        // Convert each element in the list to DataTestModel
        tests = (response.data['data'] as List<dynamic>)
            .map((e) => ChatDataModel.fromJson(e))
            .toList();
        return tests;
      }
      return tests;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }





  @override
  Future<List<DataPostsModel>> getAllMyPosts(GetAllMyPostParameters getAllMyPostParameters) async {
    try {
      List<DataPostsModel> tests=[];
      final response = await DioHelper.getData(
        bearerToken: token,
        url: ApiConstant.getallmyposts(getAllMyPostParameters.id),
      );
      if (response.data['data'] is List<dynamic>) {
        // Convert each element in the list to DataTestModel
        tests = (response.data['data'] as List<dynamic>)
            .map((e) => DataPostsModel.fromJson(e))
            .toList();
        return tests;
      }  return tests;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<PostsModel> deletePost(DeletePostParameters deletePostParameters)async {
    try{
      final response=await DioHelper.deleteData(url: ApiConstant.deleteposts(deletePostParameters.id),token: token);
      return PostsModel.fromJson(response.data);
    }
    on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<List<NotificationsModel>> getAllNotifications() async{
    try {
      List<NotificationsModel> notifications=[];
      final response = await DioHelper.getData(
        bearerToken: token,
        url: ApiConstant.getAllNotification,
      );
      if (response.data['data'] is List<dynamic>) {
        // Convert each element in the list to DataTestModel
        notifications = (response.data['data'] as List<dynamic>)
            .map((e) => NotificationsModel.fromJson(e))
            .toList();
        return notifications;
      }  return notifications;
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
  @override
  Future<NotificationsModel> deleteAllNotifications()async  {
    try {
      final response = await DioHelper.deleteData(
        token: token,
        url: ApiConstant.deleteAllNotification,
      );
      return NotificationsModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response!.data));
    }
  }
}