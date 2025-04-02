import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/statistics/manager/statistics__cubit.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_100_app_bar.dart';
import '../../../../../core/widgets/default_text_form_field.dart';
import '../../home_100/widgets/line_chart.dart';

import '../widgets/statistics_tap_item.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:  16),
          child: ListView(
            children: [
              const CustomAppBar100(
                title: AppStrings.statistic,
                widget: SizedBox(),
              ),
              const LineChartWidget(),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        StatisticsTapItem(
                          title: AppStrings.all,
                          onTap: () {
                            context.read<StatisticsCubit>().changeTabs(0);
                          },
                          index: 0,
                        ),
                        SizedBox(
                          width: AppConstants.width5(context),
                        ),
                        StatisticsTapItem(
                          title: 'تخطت الحدود ',
                          onTap: () {
                            context.read<StatisticsCubit>().changeTabs(1);
                          },
                          index: 1,
                        ),
                        SizedBox(
                          width: AppConstants.width5(context),
                        ),
                        StatisticsTapItem(
                          title: 'تحتاج لصيانة',
                          onTap: () {
                            context.read<StatisticsCubit>().changeTabs(2);
                          },
                          index: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.height20(context),
                  ),
                  context.read<StatisticsCubit>().selectedTab == 0
                      ? const Column(
                          children: [
                            SensorDataCard(
                              sensorId: '125#',
                              location: 'نوع المستشعر: في الطابق 5 غرفة',
                              minHumidity: '50%',
                              maxHumidity: '45%',
                              minTemperature: '25°C',
                              maxTemperature: '25°C',
                              color: AppColors.red10,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SensorDataCard(
                              sensorId: '125#',
                              location: 'نوع المستشعر: في الطابق 5 غرفة',
                              minHumidity: '50%',
                              maxHumidity: '45%',
                              minTemperature: '25°C',
                              maxTemperature: '25°C',
                              color: Color(0x4d99caff),
                            ),
                          ],
                        )
                      : context.read<StatisticsCubit>().selectedTab == 1
                          ? const SensorDataCard(
                              sensorId: '125#',
                              location: 'نوع المستشعر: في الطابق 5 غرفة',
                              minHumidity: '50%',
                              maxHumidity: '45%',
                              minTemperature: '25°C',
                              maxTemperature: '25°C',
                              color: AppColors.red10,
                            )
                          : const SensorDataCard(
                              sensorId: '125#',
                              location: 'نوع المستشعر: في الطابق 5 غرفة',
                              minHumidity: '50%',
                              maxHumidity: '45%',
                              minTemperature: '25°C',
                              maxTemperature: '25°C',
                              color: Color(0x4d99caff),
                            ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
// SizedBox(height: 16),

// SizedBox(height: 16),

class LegendDot extends StatelessWidget {
  final Color color;
  final String title;

  const LegendDot({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class SensorDataCard extends StatelessWidget {
  final String sensorId;
  final String location;
  final String minHumidity;
  final String maxHumidity;
  final String minTemperature;
  final String maxTemperature;
  final Color color;

  const SensorDataCard({
    super.key,
    required this.sensorId,
    required this.location,
    required this.minHumidity,
    required this.maxHumidity,
    required this.minTemperature,
    required this.maxTemperature,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue10),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مستشعر الحرارة $sensorId',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الرطوبة',
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'الحد الأدنى: $minHumidity',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'الحد الأعلى: $maxHumidity',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'درجة الحرارة',
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'الحد الأدنى: $minTemperature',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'الحد الأعلى: $maxTemperature',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
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
      TextEditingController(text: '1');
  DateTime? addDate = DateTime(2025, 5, 20);
  DateTime? activateDate = DateTime(2025, 5, 20, 8, 0);
  String? selectedTemp = 'نشط';
  String? selectedHumidity = 'الكل';
  String? selectedStatus = 'نشط';
  List<String> tempOptions = ['نشط', 'غير نشط'];
  List<String> humidityOptions = ['الكل', 'مستشعر 1', 'مستشعر 2'];
  List<String> statusOptions = ['نشط', 'غير نشط'];

  @override
  void dispose() {
    sensorIdController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isAddDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isAddDate
          ? (addDate ?? DateTime.now())
          : (activateDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      if (isAddDate) {
        setState(() {
          addDate = picked;
        });
      } else {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(activateDate ?? DateTime.now()),
        );
        if (pickedTime != null) {
          setState(() {
            activateDate = DateTime(
              picked.year,
              picked.month,
              picked.day,
              pickedTime.hour,
              pickedTime.minute,
            );
          });
        }
      }
    }
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
              'تفعيل المستشعر',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            SensorDataField(
              label: 'رقم المستشعر',
              controller: sensorIdController,
            ),
            const SizedBox(height: 16),
            SensorDataFieldDate(
              label: 'تاريخ ووقت الإضافة',
              date: addDate,
              onTap: () => _selectDate(context, true),
            ),
            const SizedBox(height: 16),
            SensorDataFieldDate(
              label: 'تاريخ ووقت التفعيل',
              date: activateDate,
              onTap: () => _selectDate(context, false),
            ),
            const SizedBox(height: 16),
            SensorDataFieldDropdown(
              label: 'إضافة درجة الحرارة',
              value: selectedTemp,
              items: tempOptions,
              onChanged: (value) {
                setState(() {
                  selectedTemp = value;
                });
              },
            ),
            const SizedBox(height: 16),
            SensorDataFieldDropdown(
              label: 'إضافة الرطوبة',
              value: selectedHumidity,
              items: humidityOptions,
              onChanged: (value) {
                setState(() {
                  selectedHumidity = value;
                });
              },
              showRemove: true,
              onRemove: () {
                setState(() {
                  selectedHumidity = null;
                });
              },
            ),
            const SizedBox(height: 16),
            SensorDataFieldDropdown(
              label: 'الحالة',
              value: selectedStatus,
              items: statusOptions,
              onChanged: (value) {
                setState(() {
                  selectedStatus = value;
                });
              },
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DefaultTextFormField(
          textInputType: TextInputType.text,
          controller: controller,
          borderSideColor: AppColors.kPrimaryColor,
        ),
      ],
    );
  }
}

class SensorDataFieldDate extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  const SensorDataFieldDate({
    super.key,
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date != null
                      ? DateFormat(
                              'dd-MM-yyyy${label.contains("تفعيل") ? " h:mm a" : ""}')
                          .format(date!)
                      : 'اختر التاريخ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.calendar_today, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SensorDataFieldDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool showRemove;
  final VoidCallback? onRemove;

  const SensorDataFieldDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.showRemove = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
              if (showRemove && value != null)
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.blue),
                  onPressed: onRemove,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
