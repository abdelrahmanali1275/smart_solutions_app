import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_solutions_application/data/models/notification_model.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {
  final List<NotificationModel> notifications;

  NotificationsSuccess(this.notifications);
}

class NotificationsFailure extends NotificationsState {
  final String errorMessage;

  NotificationsFailure(this.errorMessage);
}
