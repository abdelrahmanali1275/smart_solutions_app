import 'package:flutter/material.dart';
import '../../../../../core/utils/app_constants.dart';


class SensorCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? backgroundColor;
  final bool showDot;

  const SensorCard({
    super.key,
    required this.title,
    required this.value,
    this.backgroundColor,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.height10(context)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: AppConstants.height15(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppConstants.height20(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: AppConstants.height20(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showDot)
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
