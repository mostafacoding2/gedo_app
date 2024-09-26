part of 'community_cubit.dart';
@immutable
abstract class CommunityState {}
 class CommunityInitialState extends CommunityState {}
class CreatePostLoadingState extends CommunityState {}
class UploadImageState extends CommunityState {}
class CreatePostSuccessState extends CommunityState {}
class CreatePostErrorState extends CommunityState {
  final String error;
  CreatePostErrorState(this.error);}

class GetAllPostsLoadingState extends CommunityState {}
class GetAllPostsSuccessState extends CommunityState {
  final List<DataPosts>data;
  GetAllPostsSuccessState(this.data);
}
class GetAllPostsErrorState extends CommunityState {
  final String error;
  GetAllPostsErrorState(this.error);
}

class GetAllMyPostsLoadingState extends CommunityState {}
class GetAllMyPostsSuccessState extends CommunityState {
 final List<DataPosts>mydata;
  GetAllMyPostsSuccessState(this.mydata);
}
class GetAllMyPostsErrorState extends CommunityState {
  final String error;
  GetAllMyPostsErrorState(this.error);
}
class CreatecommentLoadingState extends CommunityState{}
class CreatecommentSuccessState extends CommunityState{}
class CreatecommentErrorState extends CommunityState{
  final String error;
  CreatecommentErrorState(this.error);
}
class GetAllCommentLoadingState extends CommunityState{}
class GetAllCommentSuccessState extends CommunityState{
  final List<DataPosts>comments;
  GetAllCommentSuccessState(this.comments);
}
class GetAllCommentErrorState extends CommunityState {
  final String error;
  GetAllCommentErrorState(this.error);
}
class TogglePostLikesLoadingState extends CommunityState{}
class TogglePostLikesSuccessState extends CommunityState{

}
class TogglePostLikesErrorState extends CommunityState{
  final String error;
  TogglePostLikesErrorState(this.error);
}
class ToggleCommentLikesLoadingState extends CommunityState{}
class ToggleCommentLikesSuccessState extends CommunityState{}
class ToggleCommentLikesErrorState extends CommunityState{
  final String error;
  ToggleCommentLikesErrorState(this.error);
}
class CreateMessageLoadingState extends CommunityState{}
class CreateMessageSuccessState extends CommunityState{}
class CreateMessageErrorState extends CommunityState{
  final String error;
  CreateMessageErrorState(this.error);
}

class GetAllMessagesLoadingState extends CommunityState{}
class GetAllMessagesSuccessState extends CommunityState{
 final  List<ChatData>data;
  GetAllMessagesSuccessState(this.data);
}
class GetAllMessagesErrorState extends CommunityState{
  final String error;
  GetAllMessagesErrorState(this.error);
}
class DeletePostLoadingState extends CommunityState{}
class DeletePostSuccessState extends CommunityState{

}
class DeletePostErrorState extends CommunityState{
  final String error;
  DeletePostErrorState(this.error);
}
class GetAllNotificationsLoadingState extends CommunityState{}
class GetAllNotificationsSuccessState extends CommunityState{
final  List<NotificationEntity> notifications;
  GetAllNotificationsSuccessState(this.notifications);
}
class GetAllNotificationsErrorState extends CommunityState{
  final String error;
  GetAllNotificationsErrorState(this.error);
}
class DeleteAllNotificationsLoadingState extends CommunityState{}
class DeleteAllNotificationsSuccessState extends CommunityState{
}
class DeleteAllNotificationsErrorState extends CommunityState{
  final String error;
  DeleteAllNotificationsErrorState(this.error);
}