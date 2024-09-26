import 'package:equatable/equatable.dart';
class NotificationEntity extends Equatable {
  final String? id;
  final String? user;
  final String? message;
  final bool? read;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  const NotificationEntity(
      { required this.id, required this.user, required this.message, required this.read, required this.createdAt, required this.updatedAt, required this.v});
  @override
  List<Object?> get props => [id, user, updatedAt, createdAt, message, v, read];
}