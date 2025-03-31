import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/core/utils/styles.dart';

class TermsUseScreen extends StatelessWidget {
  const TermsUseScreen({super.key});

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
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
            width: double.infinity,
          ),
          Text(
            "شروط الاستخدام",
            style: Styles.titleTextStyle,
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedBox(
            width: 345.w,
            child: Text(
              'يُرجى قراءة شروط الاستخدام التالية بعناية قبل استخدام موقعنا. باستخدامك للموقع، فإنك توافق على الالتزام بجميع الشروط والأحكام الواردة هنا. يُحظر عليك استخدام الموقع لأي غرض غير قانوني أو مخالف للقوانين المحلية. نحن نحتفظ بالحق في تعديل أو تحديث الشروط في أي وقت، ويجب عليك مراجعة هذه الشروط بانتظام. جميع المحتويات والمواد على الموقع محمية بحقوق الملكية الفكرية ولا يجوز نسخها أو توزيعها دون إذن. نحن غير مسؤولين عن أي أضرار ناتجة عن استخدام الموقع. إذا كانت لديك أي استفسارات، يرجى الاتصال بنا عبر [البريد الإلكتروني] أو زيارة صفحة الدعم الخاصة بنا.',
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
