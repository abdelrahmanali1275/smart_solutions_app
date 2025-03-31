import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_solutions_application/app_bloc_observer.dart';
import 'package:smart_solutions_application/constants.dart';
import 'package:smart_solutions_application/core/utils/app_router.dart';
import 'package:smart_solutions_application/core/utils/service_locator.dart';
import 'package:smart_solutions_application/data/Auth_cubit/auth_cubit.dart';
import 'package:smart_solutions_application/data/repos/activity/activity_repo_implementation.dart';
import 'package:smart_solutions_application/data/repos/employee/employee_repo_implementaion.dart';
import 'package:smart_solutions_application/data/repos/facilities/facilities_repo_implementaion.dart';
import 'package:smart_solutions_application/data/repos/home/home_repo_implementation.dart';
import 'package:smart_solutions_application/data/repos/notifications/notification_repo_implementation.dart';
import 'package:smart_solutions_application/data/repos/owners/owners_repo_implementation.dart';
import 'package:smart_solutions_application/data/repos/profile/profile_repo_implementation.dart';
import 'package:smart_solutions_application/data/repos/services/services_repo_implementation.dart';
import 'package:smart_solutions_application/presentaion/manager/activity_cubit/activity_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/admin_profile_cubit/admin_profile_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/employees_cubit/employees_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/facilities_cubit/facilities_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/home_cubit/home_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/notifications_cubit/notifications_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/owners_cubit/owners_cubit.dart';
import 'package:smart_solutions_application/presentaion/manager/services_cubit/services_cubit.dart';
import 'package:smart_solutions_application/presentaion/screens/100_200_app/main_layout/presentation/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  setup();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(),
            ),
            BlocProvider(
              create: (context) => OwnersCubit(
                getIt.get<OwnersRepoImplementation>()..fetchOwners(),
              ),
            ),
            BlocProvider(
              create: (context) => ChangeNavBarStatusCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  FacilitiesCubit(FacilitiesRepoImplementation()),
            ),
            BlocProvider(
              create: (context) => ServicesCubit(ServicesRepoImplementation()),
            ),
            BlocProvider(
              create: (context) =>
                  NotificationsCubit(NotificationsRepoImplementation()),
            ),
            BlocProvider(
              create: (context) =>
                  AdminProfileCubit(ProfileRepoImplementation()),
            ),
            BlocProvider(
              create: (context) =>
                  HomeCubit(DashboardRepoImplementation())..fetchHomeData(),
            ),
            BlocProvider(
              create: (context) =>
                  EmployeeCubit(EmployeeRepositoryImpl())..fetchEmployees(),
            ),
            BlocProvider(
              create: (context) => ActivityCubit(ActivityRepoImplementation())
                ..fetchActivities(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: const Locale('ar'),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              textTheme: GoogleFonts.cairoTextTheme(),
              colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
