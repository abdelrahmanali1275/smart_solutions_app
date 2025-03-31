import 'package:go_router/go_router.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/add_notification_screens/add_notification.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/add_notification_screens/add_notification2_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/add_notification_screens/add_notification3_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/drawer_screens/admin_profile.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/drawer_screens/services_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/facility_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/main_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/notifications_screens/notifications_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/notifications_screens/send_replay_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/owner_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/bottom_nav_screens/search_screens/search_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/employee_app/screens/main_employee_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/employee_app/screens/my_services_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/add_facility_screens/add_facility_screen_step1.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/add_facility_screens/add_facility_screen_step2.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/add_facility_screens/add_facility_screen_step3.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/employee_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/employees_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/owner_app/screens/main_owner_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/privacy_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/reset_password_screen/new_password.dart';
import 'package:smart_solutions_application/presentaion/screens/reset_password_screen/otp_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/reset_password_screen/reset_password_request.dart';
import 'package:smart_solutions_application/presentaion/screens/splash_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/login_screen/login_screen.dart';
import 'package:smart_solutions_application/presentaion/screens/terms_use_screen.dart';

abstract class AppRouter {
  static const kLoginScreen = '/loginScreen';
  static const kResetPassReqScreen = '/resetPasswordRequest';
  static const kNewPassword = '/newPassword';
  static const kTermsUse = '/termsUse';
  static const kPrivacyScreen = '/privacyScreen';
  static const kOtpScreen = '/otpScreen';
  static const kMainScreen = '/mainScreen';
  static const kNotificationsScreen = '/notificationsScreen';
  static const kSendReplay = '/sendReplay';
  static const kFacilityscreen = '/facilityScreen';
  static const kOwnerScreen = '/ownerScreen';
  static const kAdminProfile = '/adminProfile';
  static const kServicesSecreen = '/servicessScreen';
  static const kSendNotiScreen = '/sendNotificationScreen';
  static const kSearchScreen = '/searchScreen';
  static const kSendNotiScreen2 = '/sendNotiScreen2';
  static const kSendNotiScreen3 = '/sendNotiScreen3';
  static const kMainOwnerScreen = '/mainOwnerScreen';
  static const kEmployeesScreen = '/employeesScreen';
  static const kEmployeeScreen = '/employeeScreen';
  static const kAddFacilityScreen1 = '/addFacilityScreen1';
  static const kAddFacilityScreen2 = '/addFacilityScreen2';
  static const kAddFacilityScreen3 = '/addFacilityScreen3';
  static const kMainEmployeeScreen = '/mainEmployeeScreen';
  static const kMyServicesScreen = '/myServicesScreen';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kResetPassReqScreen,
        builder: (context, state) => const ResetPasswordRequest(),
      ),
      GoRoute(
        path: kNewPassword,
        builder: (context, state) => const NewPassword(),
      ),
      GoRoute(
        path: kTermsUse,
        builder: (context, state) => const TermsUseScreen(),
      ),
      GoRoute(
        path: kPrivacyScreen,
        builder: (context, state) => const PrivacyScreen(),
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: kMainScreen,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        path: kNotificationsScreen,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: kSendReplay,
        builder: (context, state) => const SendReplayScreen(),
      ),
      GoRoute(
        path: kFacilityscreen,
        builder: (context, state) => const FacilityScreen(),
      ),
      GoRoute(
        path: kOwnerScreen,
        builder: (context, state) => const OwnerScreen(),
      ),
      GoRoute(
        path: kAdminProfile,
        builder: (context, state) => const AdminProfile(),
      ),
      GoRoute(
        path: kServicesSecreen,
        builder: (context, state) => const ServicesScreen(),
      ),
      GoRoute(
          path: kSendNotiScreen,
          builder: (context, state) => const AddNotificationScreen()),
      GoRoute(
          path: kSearchScreen,
          builder: (context, state) => const SearchScreen()),
      GoRoute(
          path: kSendNotiScreen2,
          builder: (context, state) => const AddNotification2Screen()),
      GoRoute(
          path: kSendNotiScreen3,
          builder: (context, state) => const AddNotification3Screen()),
      GoRoute(
          path: kMainOwnerScreen,
          builder: (context, state) => MainOwnerScreen()),
      GoRoute(
          path: kEmployeesScreen,
          builder: (context, state) => const EmployeesScreen()),
      GoRoute(
          path: kEmployeeScreen,
          builder: (context, state) => const EmployeeScreen()),
      GoRoute(
          path: kAddFacilityScreen1,
          builder: (context, state) => const AddFacilityScreenStep1()),
      GoRoute(
          path: kAddFacilityScreen2,
          builder: (context, state) => const AddFacilityScreenStep2()),
      GoRoute(
          path: kAddFacilityScreen3,
          builder: (context, state) => const AddFacilityScreenStep3()),
      GoRoute(
          path: kMainEmployeeScreen,
          builder: (context, state) => MainEmployeeScreen()),
      GoRoute(
          path: kMyServicesScreen,
          builder: (context, state) => const MyServicesScreen()),
    ],
  );
}
