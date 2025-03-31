import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_colors.dart';

class WaterReportScreen extends StatelessWidget {
  const WaterReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "سجل الأخطاء",
          style: boldTextStyle(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          20.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "السجلات والتقارير",
                style: boldTextStyle(color: AppColors.kPrimaryColor),
              ),
              Spacer(),
              SizedBox(
                height: 30,
                  width: 60,
                child: OutlinedButton(

                    style: ButtonStyle(

                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)))),

                    onPressed: () {}, child: Icon(Icons.filter_list_outlined)),
              ),
            ],
          ),
          20.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.kPrimaryColor,
                ),
                child: Center(
                  child: Text(
                    "سجل الأخطاء",
                    style: primaryTextStyle(color: Colors.white),
                  ),
                ),
              ).expand(),
              20.width,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(249, 249, 250, 0.6),
                ),
                child: Text(
                  "سجل مستوى الخزان",
                  style: primaryTextStyle(),
                ),
              ).expand(),

            ],
          ),
          20.height,
           Image.asset("assets/images/no_data.png")
        ],
      ),
    );
  }
}
