import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_solutions_application/core/widgets/default_text_form_field.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../widgets/custom_button.dart';

class UnActiveSensor extends StatelessWidget {
  const UnActiveSensor({
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
        border: Border.all(color: const Color(0xD000000)),
      ),
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
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'غير نشط',
                    style: TextStyle(color: Colors.red, fontSize: 14),
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
            borderColor: const Color(0xd000000),
          ),
        ],
      ),
    );
  }
}

class EditSensorBottomSheet extends StatefulWidget {
  const EditSensorBottomSheet({super.key});

  @override
  State<EditSensorBottomSheet> createState() => _EditSensorBottomSheetState();
}

class _EditSensorBottomSheetState extends State<EditSensorBottomSheet> {
  final TextEditingController sensorIdController =
      TextEditingController(text: '12345');
  final TextEditingController sensorNameController =
      TextEditingController(text: 'رقم المستشعر');
  final TextEditingController sensorTypeController =
      TextEditingController(text: '12345');
  final TextEditingController tempMinController =
      TextEditingController(text: '20°C');
  final TextEditingController tempMaxController =
      TextEditingController(text: '20°C');
  final TextEditingController humidityMinController =
      TextEditingController(text: '70%');
  final TextEditingController humidityMaxController =
      TextEditingController(text: '20%');
  bool isActive = true;

  @override
  void dispose() {
    sensorIdController.dispose();
    sensorNameController.dispose();
    sensorTypeController.dispose();
    tempMinController.dispose();
    tempMaxController.dispose();
    humidityMinController.dispose();
    humidityMaxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'بيانات المستشعر',
              style: Styles.textBlue16Bold,
            ),
            const Divider(),
            const SizedBox(height: 16),
            const Column(
              children: [
                SensorDataField2(
                  label: 'رقم المستشعر',
                  text: "12345",
                ),
                SensorDataField2(
                  label: 'اسم المستشعر',
                  text: 'اسم المستشعر',
                ),
                SensorDataField2(
                  label: 'نوع المستشعر',
                  text: 'مستشعر حرارة',
                ),
                SensorDataField2(
                  label: 'رقم العنوان الخاص بالمستشعر',
                  text: '12345',
                ),
                SensorDataField2(
                  label: 'عنوان المستشعر',
                  text: 'عنوان المستشعر',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SensorDataField(
                    label: 'درجة الحرارة الأدنى',
                    controller: tempMinController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SensorDataField(
                    label: 'درجة الحرارة الأعلى',
                    controller: tempMaxController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SensorDataField(
                    label: 'الرطوبة الأدنى',
                    controller: humidityMinController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SensorDataField(
                    label: 'الرطوبة الأعلى',
                    controller: humidityMaxController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'الحالة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'مغلق',
                      style: TextStyle(fontSize: 14),
                    ),
                    Switch(
                      value: isActive,
                      onChanged: (value) {
                        setState(() {
                          isActive = value;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    const Text(
                      'نشط',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('إلغاء'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // هنا يمكنك إضافة منطق حفظ البيانات
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('تفعيل'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class SensorDataField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const SensorDataField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8,),
          DefaultTextFormField(textInputType: TextInputType.text,
          controller:controller ,
          borderSideColor: AppColors.kPrimaryColor,
          ),

        ],
      ),
    );
  }
}

class SensorDataField2 extends StatelessWidget {
  final String label;
  final String text;

  const SensorDataField2({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffE6ECEF),

              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
