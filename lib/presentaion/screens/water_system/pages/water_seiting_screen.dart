import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_colors.dart';

class WaterSitingScreen extends StatelessWidget {
  const WaterSitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الإعدادت",
          style: boldTextStyle(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(249, 249, 250, 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "حالة النظام",
                      style: primaryTextStyle(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "غير نشط",
                          style: boldTextStyle(),
                        ),
                        Switch(
                          activeColor: AppColors.grey,
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    )
                  ],
                ),
              ).expand(),
            ],
          ),
          20.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(249, 249, 250, 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " إعدادات التحديث",
                          style: primaryTextStyle(),
                        ),
                        OutlinedButton.icon(
                          style: ButtonStyle(

                            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 1,horizontal: 10)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {},
                          label: Text(
                            "تعديل",
                            style: primaryTextStyle(color: AppColors.successGreen),
                          ),
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.successGreen,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الرقم التسلسلي",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "12345",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الإصدار البرمجي",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "v1.2.0",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),

                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " سرعة التحديث",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "1 دقيقة",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "IP Address",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "192.168.1.10",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MAC Address",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "AA:BB:CC:DD:EE:01",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Device ID",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "1001",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),

                  ],
                ),
              ).expand(),
            ],
          ),
          20.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(249, 249, 250, 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " إعدادات الخزان",
                          style: primaryTextStyle(),
                        ),
                        OutlinedButton.icon(
                          style: ButtonStyle(

                              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 1,horizontal: 10)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {},
                          label: Text(
                            "تعديل",
                            style: primaryTextStyle(color: AppColors.successGreen),
                          ),
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.successGreen,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Center(child: Image.asset("assets/images/tank.png")),
                    20.height,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الرقم التسلسلي",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "12345",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الإصدار البرمجي",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "v1.2.0",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),

                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " سرعة التحديث",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "1 دقيقة",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "IP Address",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "192.168.1.10",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MAC Address",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "AA:BB:CC:DD:EE:01",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Device ID",
                          style: secondaryTextStyle(),
                        ).expand(),
                        Text(
                          "1001",
                          style: boldTextStyle(),
                        ).expand(),
                      ],
                    ),

                  ],
                ),
              ).expand(),
            ],
          ),
        ],
      ),
    );
  }
}
