import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_solutions_application/core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/default_text_form_field.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.sensorAndNum,
            style: Styles.textBlack14Bold,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '11 فبراير 2025 | 8 :30 pm',
            style: TextStyle(fontSize: 14, color: Color(0x661c1c1c)),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Color(0xD000000),
            endIndent: 30,
            indent: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'قيمة الرطوبة',
                style: TextStyle(fontSize: 14, color: Color(0x661c1c1c)),
              ),
              Text(
                '75 %',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'قيمة الحرارة',
                style: TextStyle(fontSize: 14, color: Color(0x661c1c1c)),
              ),
              Text(
                '24°C',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'إنذار الحرارة',
                style: TextStyle(fontSize: 14, color: Color(0x661c1c1c)),
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
                    style: TextStyle(
                      color: Color(0xff4AA785),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'سبب إنذار الرطوبة',
                style: TextStyle(fontSize: 14, color: Color(0x661c1c1c)),
              ),
              Text(
                'ارتفاع حرارة',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'إنذار الرطوبة',
                style: TextStyle(fontSize: 14, color: Color(0x661c1c1c)),
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
                    style: TextStyle(
                      color: Color(0xff4AA785),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'سبب إنذار الحرارة',
                style: TextStyle(fontSize: 14, color: Color(0x661c1c1c)),
              ),
              Text(
                'ارتفاع حرارة',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditReportBottomSheet extends StatefulWidget {
  const EditReportBottomSheet({super.key});

  @override
  State<EditReportBottomSheet> createState() => _EditReportBottomSheetState();
}

class _EditReportBottomSheetState extends State<EditReportBottomSheet> {
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
              'تصفية السجلات',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 16),
            ReportDataField(
              label: 'رقم المستشعر',
              controller: sensorIdController,
            ),
            const SizedBox(height: 16),
            ReportDataFieldDate(
              label: 'تاريخ ووقت البداية',
              date: addDate,
              onTap: () => _selectDate(context, true),
            ),
            const SizedBox(height: 16),
            ReportDataFieldDate(
              label: 'تاريخ ووقت النهاية ',
              date: activateDate,
              onTap: () => _selectDate(context, false),
            ),
            const SizedBox(height: 16),
            ReportDataFieldDropdown(
              label: 'إنذار الحرارة',
              value: selectedTemp,
              items: tempOptions,
              onChanged: (value) {
                setState(() {
                  selectedTemp = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ReportDataFieldDropdown(
              label: 'إنذار الرطوبة ',
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

class ReportDataField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const ReportDataField({
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

class ReportDataFieldDate extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  const ReportDataFieldDate({
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

class ReportDataFieldDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool showRemove;
  final VoidCallback? onRemove;

  const ReportDataFieldDropdown({
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
