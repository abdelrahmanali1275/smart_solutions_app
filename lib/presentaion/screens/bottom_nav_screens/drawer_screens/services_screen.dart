import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_strings.dart';
import 'package:smart_solutions_application/core/utils/assets.dart';
import 'package:smart_solutions_application/presentaion/manager/services_cubit/services_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/services_cubit/services_state.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/widgets/service_widget.dart';
import 'package:smart_solutions_application/presentaion/widgets/simple_app_bar.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ServicesCubit>(context).fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: AppStrings.services.tr()),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state is ServicesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ServicesFailure) {
              return Center(
                child: Text(
                  '${AppStrings.errorPrefix.tr()}: ${state.errorMessage}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.sp,
                  ),
                ),
              );
            } else if (state is ServicesSuccess) {
              final services = state.services;

              if (services.isEmpty) {
                return Center(
                  child: Text(AppStrings.noServicesAvailable.tr()),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.allServicesInSite.tr(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: kTextColorLight,
                        letterSpacing: -2 / 12,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return ServiceWidget(
                          image: service.image ?? AppAssets.ghaz,
                          name: service.nameAr,
                          title: service.nameEn ?? AppStrings.noDescription.tr(),
                          des: service.nameEn ?? AppStrings.noDetails.tr(),
                          installDuration: service.installDuration,
                          price: service.price,
                          subscribersCount: service.subscribersCount ?? 0,
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(AppStrings.unknownState.tr()),
              );
            }
          },
        ),
      ),
    );
  }
}