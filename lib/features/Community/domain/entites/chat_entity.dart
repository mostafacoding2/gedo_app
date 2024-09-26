import 'package:equatable/equatable.dart';
class ChatEntity extends Equatable {
  final String? status;
  final int? code;
  final String? message;
  final ChatData? data;
  const ChatEntity({required this.status,
    required this.code,
    required this.message,
    required this.data});
  @override
  List<Object?> get props => [status, code, message, data];
}
class ChatData extends Equatable {
  final String? id;
  final String? senderId;
  final String? recipientId;
  final ImageChat? imageChat;
  final String? message;
  final VoiceNote? voiceNote;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const ChatData({required this.id,
    required this.senderId,
    required this.recipientId,
    required this.imageChat,
    required this.message,
    required this.voiceNote,
    required this.createdAt,
    required this.updatedAt,
    required this.v});

  @override
  List<Object?> get props =>
      [
        id,
        senderId,
        recipientId,
        imageChat,
        message,
        voiceNote,
        createdAt,
        updatedAt,
        v,
      ];
}


class ImageChat extends Equatable {
  final String? url;
  final dynamic publicId;
  const ImageChat({ required this.url, required this.publicId});
  @override
  List<Object?> get props => [url, publicId];
}

class VoiceNote extends Equatable {
  final String? url;
  final dynamic publicId;
  const VoiceNote({ required this.url, required this.publicId});
  @override
  List<Object?> get props => [url, publicId];
}

