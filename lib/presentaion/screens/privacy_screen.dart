import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
            width: double.infinity,
          ),
          Text(
            "سياسة الخصوصية",
            style: Styles.titleTextStyle,
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedBox(
            width: 345.w,
            child: Text(
              'نحن ملتزمون بحماية معلوماتك الشخصية. نقوم بجمع البيانات الشخصية التي تقدمها لنا، مثل الاسم والبريد الإلكتروني، فقط لتقديم خدماتنا بشكل أفضل. تُستخدم هذه المعلومات لتخصيص تجربتك وتزويدك بالمعلومات والتحديثات التي قد تكون ذات صلة لك. نحن لا نشارك معلوماتك مع أطراف ثالثة دون موافقتك. نقوم بتطبيق إجراءات أمان مناسبة لحماية بياناتك من الوصول غير المصرح به. يمكنك طلب الوصول إلى معلوماتك الشخصية أو تعديلها في أي وقت. نحتفظ بالحق في تعديل سياسة الخصوصية هذه عند الحاجة. لمزيد من التفاصيل، يرجى الاتصال بنا عبر [البريد الإلكتروني] أو زيارة موقعنا.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 1.9.h,
                  letterSpacing: -20 / 100,
                  color: Color(0xff50555C)),
            ),
          ),
        ],
      ),
    );
  }
}
