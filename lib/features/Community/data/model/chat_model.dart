import 'package:alzcare/features/Community/domain/entites/chat_entity.dart';
class ChatModel extends ChatEntity{
  ChatModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data});

 factory ChatModel.fromJson(Map<String, dynamic> json) =>ChatModel(status: json['status'], code: json['code'], message: json['message'],
     data: json['data']!=null&& json['data'] is Map<String,dynamic>?ChatDataModel.fromJson(json['data']):null
 );

}
class ChatDataModel extends ChatData{
  ChatDataModel({
    required super.id,
    required super.senderId,
    required super.recipientId,
    required super.imageChat,
    required super.message,
    required super.voiceNote,
    required super.createdAt,
    required super.updatedAt,
    required super.v
  });
factory ChatDataModel.fromJson(Map<String, dynamic> json) =>
    ChatDataModel(
        id: json['_id'],
        senderId: json['senderId'],
        recipientId: json['recipientId'],
        imageChat: json['image']!=null&& json['image'] is Map<String,dynamic>?ImageChatModel.fromJson(json['image']):null ,
        message: json['message'],
        voiceNote: json['voiceNote']!=null&& json['voiceNote'] is Map<String,dynamic>?VoiceNoteModle.fromJson(json['voiceNote']):null ,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        v:json['__v']
    );
}

class ImageChatModel extends ImageChat{
  ImageChatModel({
    required super.url,
    required super.publicId
  });
  factory ImageChatModel.fromJson(Map<String, dynamic> json) =>
      ImageChatModel(url:json['url'], publicId: json['publicId']);

}

class VoiceNoteModle extends VoiceNote{
  VoiceNoteModle({
    required super.url,
    required super.publicId
  });
  factory VoiceNoteModle.fromJson(Map<String, dynamic> json) =>
      VoiceNoteModle(url:json['url'], publicId: json['publicId']);

}