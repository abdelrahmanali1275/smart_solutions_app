import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/data/repos/notifications/notification_repo.dart';
import 'package:smart_solutions_application/presentaion/manager/notifications_cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo notificationsRepo;

  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());
    final result = await notificationsRepo.fetchNotifications();

    result.fold(
      (failure) => emit(NotificationsFailure(failure.errorMessage)),
      (notifications) => emit(NotificationsSuccess(notifications)),
    );
  }
}
