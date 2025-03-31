import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/empty_screen.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';
import 'package:smart_solutions_application/presentaion/manager/notifications_cubit/notifications_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/notifications_cubit/notifications_state.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'notifications_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedTabIndex = 0;
  final Map<int, bool> _readStatus = {};

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationsCubit>(context).fetchNotifications();
    timeago.setLocaleMessages('ar', timeago.ArMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: AppStrings.notifications.tr()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, top: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTabBar(),
              SizedBox(height: 24.h),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await context
                        .read<NotificationsCubit>()
                        .fetchNotifications();
                  },
                  child: BlocBuilder<NotificationsCubit, NotificationsState>(
                    builder: (context, state) {
                      if (state is NotificationsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is NotificationsSuccess) {
                        final notifications = state.notifications;

                        if (notifications.isEmpty) {
                          return EmptyScreen(
                            image: AppAssets.noNoti,
                            title: AppStrings.noNotificationsAvailable.tr(),
                          );
                        }

                        return ListView.builder(
                          itemCount: notifications.length,
                          itemBuilder: (context, index) {
                            final notification = notifications[index];
                            final isRead =
                                _readStatus[index] ?? notification.isRead;

                            return NotificationItem(
                              message: notification.message,
                              createdAt: _formatTime(notification.createdAt),
                              isNew: !isRead,
                              hasReply: true,
                              onTap: () {
                                setState(() {
                                  _readStatus[index] =
                                  true;
                                });
                              },
                            );
                          },
                        );
                      } else if (state is NotificationsFailure) {
                        return Center(
                          child: Text(
                            '${AppStrings.errorPrefix.tr()}: ${state.errorMessage}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.red,
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(AppStrings.unknownState.tr()),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildFilterTab(AppStrings.all.tr(), 0),
          _buildFilterTab(AppStrings.needsReply.tr(), 1),
          _buildFilterTab(AppStrings.myNotifications.tr(), 2),
          _buildFilterTab(AppStrings.facilityStaffNotifications.tr(), 3),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label, int index) {
    bool isSelected = _selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 4.w),
        child: Container(
          height: 32.h,
          margin: EdgeInsets.only(left: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : const Color(0xffF4F5F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const Color(0xff000000).withOpacity(0.5),
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(String dateTime) {
    final date = DateTime.parse(dateTime);
    return timeago.format(date, locale: 'ar');
  }
}

