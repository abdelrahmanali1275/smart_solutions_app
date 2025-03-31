
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_colors.dart';

class WaterLeakageScreen extends StatelessWidget {
  const WaterLeakageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "بيانات التسرب",
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
                " فحص التسرب",
                style: boldTextStyle(color: AppColors.kPrimaryColor),
              ),
              Spacer(),
              SizedBox(
                height: 30,
                child: OutlinedButton.icon(
                  label: Text("ضبط الفحص",style: secondaryTextStyle(color: AppColors.kPrimaryColor),),

                    style: ButtonStyle(

                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(5)))),

                    onPressed: () {}, icon: Icon(Icons.settings,color: AppColors.kBrandColor,)),
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
                  color: const Color.fromRGBO(249, 249, 250, 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "بيانات فحص التسريب النشط",
                      style: primaryTextStyle(color: AppColors.kPrimaryColor),
                    ),

                    Text(
                      "العملية 1023# || خزان #1",
                      style: boldTextStyle(size: 12),
                    ),
                   15.height,
                   Divider(),
                    25.height,

                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: secondaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

                      ],
                    ),
                    10.height,

                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

                      ],
                    ),
                    10.height,

                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

                      ],
                    ),


                  ],
                ),
              ).expand(),

            ],
          ),
          35.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "بيانات التسريب",
                style: boldTextStyle(color: AppColors.kPrimaryColor),
              ),
              Spacer(),
              SizedBox(
                height: 30,
                child: OutlinedButton(

                    style: ButtonStyle(

                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(5)))),

                    onPressed: () {}, child: Icon(Icons.filter_list_outlined,color: AppColors.kBrandColor,)),
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
                  color: const Color.fromRGBO(249, 249, 250, 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "العملية 11  |  الخزان 2#",
                      style: primaryTextStyle(color: AppColors.kPrimaryColor),
                    ),

                    Text(
                      "التاريخ والوقت : 10/02/2025 12:00 - 10/02/2025 12:00",
                      style: primaryTextStyle(size: 12),
                    ),
                    15.height,
                    Divider(),
                    25.height,

                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: secondaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

                      ],
                    ),
                    10.height,

                    Row(
                      children: [
                        Text("ارتفاع السائل",style: primaryTextStyle(size:13,color: AppColors.kPrimaryColor),).expand(),
                        Text("قيمة التسريب",style: primaryTextStyle(size:13,color: AppColors.kPrimaryColor)).expand(),
                      ],
                    ),
                    10.height,


                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

                      ],
                    ),
                    10.height,

                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

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
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(249, 249, 250, 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "العملية 11  |  الخزان 2#",
                      style: primaryTextStyle(color: AppColors.kPrimaryColor),
                    ),

                    Text(
                      "التاريخ والوقت : 10/02/2025 12:00 - 10/02/2025 12:00",
                      style: primaryTextStyle(size: 12),
                    ),
                    15.height,
                    Divider(),
                    25.height,

                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: secondaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

                      ],
                    ),
                    10.height,

                    Row(
                      children: [
                        Text("ارتفاع السائل",style: primaryTextStyle(size:13,color: AppColors.kPrimaryColor),).expand(),
                        Text("قيمة التسريب",style: primaryTextStyle(size:13,color: AppColors.kPrimaryColor)).expand(),
                      ],
                    ),
                    10.height,


                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

                      ],
                    ),
                    10.height,

                    Row(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "تاريخ البداية    ",style: primaryTextStyle(size: 15)),
                          TextSpan(text: "2025-03-01",style: boldTextStyle(size: 15)),

                        ])).expand(),

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
