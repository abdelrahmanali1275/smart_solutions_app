import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/widgets/custom_100_app_bar.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/reports_100/widgets/search_widget.dart';

import '../../../../../core/utils/styles.dart';
import '../widgets/report_widget.dart';

class ReportsScreen100 extends StatelessWidget {
  const ReportsScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  16),
          child: ListView(
            children: [
              CustomAppBar100(
                title: AppStrings.reports,
                widget: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => const SensorLogsBottomSheet(),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.plus,
                        color: AppColors.darkGreen,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'تصدير',
                        style:
                            TextStyle(color: AppColors.darkGreen, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                AppStrings.reportAndHistory,
                style: Styles.textBlue16Bold,
              ),
              const SizedBox(
                height: 10,
              ),
              const SearchWidget(),
              const SizedBox(
                height: 20,
              ),
              const ReportWidget(),
              const SizedBox(
                height: 20,
              ),
              const ReportWidget(),
            ],
          )),
    );
  }
}

class SensorLogsBottomSheet extends StatelessWidget {
  const SensorLogsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text('تصدير CSV'),
          Divider(),
          SizedBox(height: 8),
          Text('تصدير Excel'),
          Divider(),
          SizedBox(height: 8),
          Text('تصدير PDF'),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
