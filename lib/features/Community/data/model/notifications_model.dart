import 'package:alzcare/features/Community/domain/entites/notifications_entity.dart';

class NotificationsModel extends NotificationEntity {
  const NotificationsModel(
      {required super.id,
      required super.user,
      required super.message,
      required super.read,
      required super.createdAt,
      required super.updatedAt,
      required super.v});
  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
          id: json['_id'],
          user: json['user'],
          message: json['message'],
          read: json['read'],
          createdAt: json['createdAt'],
          updatedAt: json['updatedAt'],
          v: json['__v']);
}
