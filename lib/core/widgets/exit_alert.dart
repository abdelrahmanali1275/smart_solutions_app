// import 'dart:io';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:eduai_teacher/core/utils/strings/app_strings.dart';
// import 'package:flutter/material.dart';
// import '../utils/app_strings.dart';
// import '../utils/colors/colors.dart';
// import '../utils/constants.dart';
// import 'custom_button.dart';
//
// void exitDialog(context) {
//   showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             title: Text(
//               AppStrings.exit.tr(),
//               textAlign: TextAlign.center,
//             ),
//             content: Text(
//               AppStrings.exitQuestion .tr(),
//             ),
//             actions: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: DefaultButton(
//                       onPress: () {
//                         exit(0);
//                       },
//                       text: AppStrings.exit.tr(),
//                       backgroundColor: AppColors.primaryColor,
//                       borderRadius: AppConstants.sp10(context),
//                     fontSize: MediaQuery.of(context).size.height*.018,
//                     ),
//                   ),
//                   SizedBox(
//                     width: AppConstants.width20(context),
//                   ),
//                   Expanded(
//                       child: DefaultButton(
//                     onPress: () {
//                       Navigator.pop(context);
//                     },
//                     text: AppStrings.cancel.tr(),
//                         textColor: AppColors.primaryColor,
//                     backgroundColor: Colors.grey.shade300,
//                         borderRadius: AppConstants.sp10(context),
//                     fontSize: MediaQuery.of(context).size.height*.018,
//                   )),
//                 ],
//               ),
//             ],
//           ));
// }
