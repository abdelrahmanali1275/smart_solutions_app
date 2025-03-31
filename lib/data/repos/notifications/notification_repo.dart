import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/notification_model.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, List<NotificationModel>>> fetchNotifications();
}
