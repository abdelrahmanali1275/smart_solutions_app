import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/sensors_100/widgets/un_active_sensor.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/styles.dart';

class ActiveSensor extends StatelessWidget {
  const ActiveSensor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.height20(context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppConstants.height10(context),
          ),
          border: Border.all(color: const Color(0xD000000))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.sensorH,
            style: Styles.textBlack16Bold,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Color(0xD000000),
            endIndent: 30,
            indent: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الحالة',
                style: TextStyle(fontSize: 14),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Color(0xff4AA785),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'نشط',
                    style: TextStyle(color: Color(0xff4AA785), fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الموقع :',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'الطابق العلوي',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'درجة الحرارة الحالية',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '24',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'درجة الرطوبة الحالية',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '24',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.85,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => const EditSensorBottomSheet(),
              );
            },
            title: "تعديل القيم",
            textColor: AppColors.black,
            widget: SvgPicture.asset(AppAssets.edit),
            color: Colors.white,
            borderColor: Color(0xd000000),
          )
        ],
      ),
    );
  }
}
