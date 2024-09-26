import 'dart:async';
import 'package:alzcare/core/base_use_case/base_use_case.dart';
import 'package:alzcare/features/Community/domain/entites/chat_entity.dart';
import 'package:alzcare/features/Community/domain/entites/notifications_entity.dart';
import 'package:alzcare/features/Community/domain/entites/posts_entity.dart';
import 'package:alzcare/features/Community/domain/usecase/create_comment_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/create_post_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/delete_all_notification_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/delete_post_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_comments_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_myposts_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_notification_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/get_all_posts_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/post_message_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_comment_likes_use_case.dart';
import 'package:alzcare/features/Community/domain/usecase/toggle_post_likes_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'community_state.dart';
class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit(this.delelteAllNotificationUseCase,this.getAllNotificationUseCase,
      this.deletePostUsecase,
      this.getAllMyPostUsecase,
      this.getAlMessagesChatUseCase,
      this.postMessageUseCase,
      this.toggleCommentLikesUseCase,
      this.getAllCommentUseCase,
      this.createPostUseCase,
      this.getAllPostUsecase,
      this.createCommentUseCase,
      this.togglePostLikesUseCase)
      : super(CommunityInitialState());
  static CommunityCubit get(context) => BlocProvider.of(context);
  XFile? imagePicker;
  uploadimage(XFile image) {
    imagePicker = image;
    emit(UploadImageState());
  }

  CreatePostUseCase createPostUseCase;
  Future createPost({ String? text}) async {
    emit(CreatePostLoadingState());
    FormData formData;
    if (imagePicker != null) {
      formData = FormData.fromMap({
        'image': [await uploadImagetoApi(imagePicker!)],
        'text': text,
      });
    } else {
      formData = FormData.fromMap({
        'text': text,
      });
    }
    final result = await createPostUseCase(formData);
    result.fold((l) {
      emit(CreatePostErrorState(l.message));
    }, (r) {
      emit(CreatePostSuccessState());
    });
  }

  List<DataPosts> data = [];
  GetAllPostUsecase getAllPostUsecase;
  FutureOr<void> getAllPosts() async {
    emit(GetAllPostsLoadingState());
    final result = await getAllPostUsecase(const NoParameters());
    result.fold((l) {
      emit(GetAllPostsErrorState(l.message));
    }, (r) {
      data = r;
      emit(GetAllPostsSuccessState(r));
    });
  }

  List<DataPosts> mydata = [];
  GetAllMyPostUsecase getAllMyPostUsecase;
  FutureOr<void> getAllMyPosts({required String id}) async {
    emit(GetAllMyPostsLoadingState());
    final result = await getAllMyPostUsecase(GetAllMyPostParameters(id));
    result.fold((l) {
      emit(GetAllMyPostsErrorState(l.message));
    }, (r) {
      mydata = r;
      emit(GetAllMyPostsSuccessState(r));
    });
  }

  CreateCommentUseCase createCommentUseCase;
  FutureOr<void> createComment(
      {required String id, required String text}) async {
    emit(CreatecommentLoadingState());
    FormData formData;
    if (imagePicker != null) {
      formData = FormData.fromMap({
        'image': [await uploadImagetoApi(imagePicker!)],
        'text': text,
      });
    } else {
      formData = FormData.fromMap({
        'text': text,
      });
    }
    final result =
        await createCommentUseCase(PostcommentParameters(formData, id));
    result.fold((l) {
      emit(CreatecommentErrorState(l.message));
    }, (r) {
      emit(CreatecommentSuccessState());
    });
  }

  List<DataPosts> comments = [];
  GetAllCommentUseCase getAllCommentUseCase;
  FutureOr<void> getAllComments({required String id}) async {
    emit(GetAllCommentLoadingState());
    final result = await getAllCommentUseCase(GetAllCommentParameters(id));
    result.fold((l) {
      emit(GetAllCommentErrorState(l.message));
    }, (r) {
      comments = r;
      emit(GetAllCommentSuccessState(r));
    });
  }

  TogglePostLikesUseCase togglePostLikesUseCase;
  FutureOr<void> togglePostLikes({required String id}) async {
    emit(TogglePostLikesLoadingState());
    final result = await togglePostLikesUseCase(TogglePostLikesParameters(id));
    result.fold((l) {
      emit(TogglePostLikesErrorState(l.message));
    }, (r) {
      emit(TogglePostLikesSuccessState());
    });
  }

  ToggleCommentLikesUseCase toggleCommentLikesUseCase;
  FutureOr<void> toggleCommentLikes({required String id}) async {
    emit(TogglePostLikesLoadingState());
    final result =
        await toggleCommentLikesUseCase(ToggleCommentLikesParameters(id));
    result.fold((l) {
      emit(TogglePostLikesErrorState(l.message));
    }, (r) {
      emit(TogglePostLikesSuccessState());
    });
  }

  PostMessageUseCase postMessageUseCase;

  FutureOr<void> postChat({ String? message,required String id}) async {
    emit(CreateMessageLoadingState());
    FormData formData;
    if (imagePicker != null&& message!=null) {
      formData = FormData.fromMap({
        'image': [await uploadImagetoApi(imagePicker!)],
        'message': message,
      });
    } else  if(imagePicker == null&& message!=null){
      formData = FormData.fromMap({
        'message': message,
      });
    }
    else{
      formData = FormData.fromMap({
        'image': [await uploadImagetoApi(imagePicker!)],
      });
    }
    final result = await postMessageUseCase(PostMessageParameters(formData,id));
    result.fold((l) {
      emit(CreateMessageErrorState(l.message));
    }, (r) {
      emit(CreateMessageSuccessState());
    });
  }

  List<ChatData> messages = [];
  GetAlMessagesChatUseCase getAlMessagesChatUseCase;
  FutureOr<void> getAllMessages({required String id} ) async {
    emit(GetAllMessagesLoadingState());
    final result =
        await getAlMessagesChatUseCase( GetAllMessageParameters(id));
    result.fold((l) {
      emit(GetAllMessagesErrorState(l.message));
    }, (r) {
      messages = r;
      emit(GetAllMessagesSuccessState(r));
    });
  }
  PostsEntity?postsEntity;
  DeletePostUsecase deletePostUsecase;
  FutureOr<void> deletePost({required String id}) async {
    emit(DeletePostLoadingState());
    final result=await deletePostUsecase(DeletePostParameters(id));
    result.fold((l) {
      emit(DeletePostErrorState(l.message));
    }, (r) {
      emit(DeletePostSuccessState());
    });
  }

  GetAllNotificationUseCase getAllNotificationUseCase;
    List<NotificationEntity> notifications=[];
  FutureOr<void> getAllNotifications() async {
    emit(GetAllNotificationsLoadingState());
    final result = await getAllNotificationUseCase(const NoParameters());
    result.fold((l) {
      emit(GetAllNotificationsErrorState(l.message));
    }, (r) {
      notifications = r;
      emit(GetAllNotificationsSuccessState(r));
    });
  }
  DelelteAllNotificationUseCase delelteAllNotificationUseCase;
  FutureOr<void> deleteAllNotifications() async {
    emit(DeleteAllNotificationsLoadingState());
    final result = await delelteAllNotificationUseCase(const NoParameters());
    result.fold((l) {
      emit(DeleteAllNotificationsErrorState(l.message));
    }, (r) {
      emit(DeleteAllNotificationsSuccessState());
    });
  }
}

uploadImagetoApi(XFile image) {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
