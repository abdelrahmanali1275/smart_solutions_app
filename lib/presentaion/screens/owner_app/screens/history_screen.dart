import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/manager/activity_cubit/activity_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/activity_cubit/activity_state.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/widgets/history_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityCubit, ActivityState>(
      builder: (context, state) {
        if (state is ActivityLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ActivityLoaded) {
          final activities = state.activities;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return HistoryWidget(
                  title: activity.description,
                  dateTime: activity.createdAt,
                  details:
                      'المستخدم قام بـ ${activity.event} في ${activity.createdAt}',
                );
              },
            ),
          );
        } else if (state is ActivityError) {
          return Center(child: Text(state.message));
        }
        return  Center(child: Text(AppStrings.noDataAvailable.tr()));
      },
    );
  }
}
