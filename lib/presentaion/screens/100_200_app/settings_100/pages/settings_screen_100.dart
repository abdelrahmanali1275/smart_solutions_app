import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';

import '../../../../../core/widgets/custom_100_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar100(
                title: AppStrings.settings,
                widget: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) => const SensorSettingsBottomSheet(),
                    );
                  },
                  child:  Row(
                    children: [
                      SvgPicture.asset(AppAssets.edit),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'تعديل',
                        style: TextStyle(color: AppColors.darkGreen, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.green10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'الحالة',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'نشط',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: Colors.green,
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0x80f9f9fa),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'اعدادت النظام',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    Divider(),
                    const SizedBox(height: 8),

                    const SensorDetailField(
                      label: 'الرقم التسلسلي',
                      value: '12345',
                    ),
                    const SizedBox(height: 16),
                    const SensorDetailField(
                      label: 'الإصدار البرمجي',
                      value: 'v1.2.0',
                    ),
                    const SizedBox(height: 16),
                    const SensorDetailField(
                      label: ' سرعة التحديث',
                      value: '1 دقيقة',
                    ),
                    const SizedBox(height: 16),
                    const SensorDetailField(
                      label: 'IP Address',
                      value: '192.168.1.10',
                    ),
                    const SizedBox(height: 16),
                    const SensorDetailField(
                      label: 'MAC Address',
                      value: 'AA:BB:CC:DD:EE:01',
                    ),
                    const SizedBox(height: 16),
                    const SensorDetailField(
                      label: 'Device ID',
                      value: '1001',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
  }
}

class SensorSettingsBottomSheet extends StatefulWidget {
  const SensorSettingsBottomSheet({super.key});

  @override
  State<SensorSettingsBottomSheet> createState() =>
      _SensorSettingsBottomSheetState();
}

class _SensorSettingsBottomSheetState extends State<SensorSettingsBottomSheet> {
  String? selectedHour = '1 ساعة';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'تعديل إعدادات التحديث',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            ' سرعة التحديث',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton<String>(
              value: selectedHour,
              isExpanded: true,
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down),
              items: <String>['1 ساعة', '2 ساعة', '3 ساعة']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedHour = newValue;
                });
              },
            ),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم حفظ الإعدادات بنجاح'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('حفظ الإعدادات'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SensorDetailField extends StatelessWidget {
  final String label;
  final String value;

  const SensorDetailField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

