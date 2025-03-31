import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_button.dart';
import 'package:smart_solutions_application/presentaion/widgets/custom_text_field.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class AddFacilityScreenStep1 extends StatefulWidget {
  const AddFacilityScreenStep1({super.key});

  @override
  _AddFacilityScreenStep1State createState() => _AddFacilityScreenStep1State();
}

class _AddFacilityScreenStep1State extends State<AddFacilityScreenStep1> {
  final TextEditingController nameFacilityController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController reginController = TextEditingController();
  final TextEditingController nameOwnerController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    nameFacilityController.addListener(_checkFields);
    cityController.addListener(_checkFields);
    reginController.addListener(_checkFields);
    nameOwnerController.addListener(_checkFields);
    emailController.addListener(_checkFields);
    phoneController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = nameFacilityController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          reginController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          nameOwnerController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    nameFacilityController.dispose();
    cityController.dispose();
    reginController.dispose();
    nameOwnerController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  SimpleAppBar(title: AppStrings.addFacility),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              CustomTextField(
                title: AppStrings.facilityName,
                textInputtype: TextInputType.text,
                controller: nameFacilityController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.city,
                textInputtype: TextInputType.text,
                controller: cityController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.region,
                textInputtype: TextInputType.text,
                controller: reginController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.owner,
                textInputtype: TextInputType.text,
                controller: nameOwnerController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.email,
                textInputtype: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                title: AppStrings.phone,
                textInputtype: TextInputType.phone,
                controller: phoneController,
              ),
              SizedBox(height: 8.h),
              SizedBox(height: 264.h),
              CustomButton(
                onTap: isButtonEnabled
                    ? () {
                  GoRouter.of(context).push(AppRouter.kAddFacilityScreen2);
                }
                    : () {},
                title: AppStrings.continueButton,
                isdisable: isButtonEnabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}