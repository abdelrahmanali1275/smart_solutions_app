import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/core/errors/failures.dart';
import 'package:smart_solutions_application/data/models/notification_model.dart';
import 'package:smart_solutions_application/data/repos/notifications/notification_repo.dart';

class NotificationsRepoImplementation extends NotificationsRepo {
  @override
  Future<Either<Failure, List<NotificationModel>>> fetchNotifications() async {
    try {
      final response = await ApiService().get('/admin/notifications');
      final data = response.data['data'] as List;

      final notifications = data
          .map((notification) => NotificationModel.fromJson(notification))
          .toList();

      return Right(notifications);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
