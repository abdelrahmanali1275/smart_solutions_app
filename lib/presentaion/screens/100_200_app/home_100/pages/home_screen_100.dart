import 'package:flutter/material.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import '../../../../../core/widgets/custom_100_app_bar.dart';
import '../widgets/line_chart.dart';
import '../widgets/sensor_card.dart';
import '../widgets/state_card.dart';

class HomeScreen100 extends StatelessWidget {
  const HomeScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar100(
              title: AppStrings.homeTitle,
              imagePath: AppAssets.profileImage,
            ),
            SizedBox(height: AppConstants.height15(context)),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 2,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                SensorCard(
                  title: 'المستشعرات النشطة',
                  value: '60%',
                  backgroundColor: AppColors.red10,
                ),
                SensorCard(
                  title: 'متوسط الرطوبة',
                  value: '5',
                  backgroundColor: AppColors.blue10,
                ),
                SensorCard(
                  title: 'حالة الجهاز',
                  value: 'نشط',
                  backgroundColor: AppColors.green10,
                  showDot: true,
                ),
                SensorCard(
                  title: 'مستشعر الحرارة',
                  value: '25°C',
                  backgroundColor: Color(0xff99CAFF),
                ),
              ],
            ),
            SizedBox(height: AppConstants.height15(context)),
            const Text("التحكم في تشغيل وإيقاف العناصر"),
            SizedBox(height: AppConstants.height15(context)),
            const Row(
              children: [
                Expanded(
                  child: StateCard(
                    title: 'SSR State',
                    subtitle: 'مغلق',
                    color: AppColors.kPrimaryColor,
                    icon: Icons.developer_board,
                    isSwitchOn: false,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: StateCard(
                    title: 'Relay State',
                    color: AppColors.accent,
                    subtitle: 'نشط',
                    icon: Icons.developer_board,
                    backgroundColor: AppColors.green10,
                    showDot: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const LineChartWidget(),
          ],
        ),
      ),
    );
  }
}
