import 'package:appwash/views/common_views/sps.dart';
import 'package:appwash/views/views.dart';
import 'package:get/get.dart';

import 'paths.dart';

class AppRoutes {
  static String INITIAL = Routes.SPLASH;

  static final routes = [
    /// Splash
    GetPage(name: Routes.SPLASH, page: () => const SpScr()),

    /// Auth
    GetPage(name: Routes.SIGNUP, page: () => SignUpScreen()),
    GetPage(name: Routes.WELCOMEBACK, page: () => const WelcomeBackScreen()),
    GetPage(name: Routes.OTPVERIFICATION, page: () => OtpVerificationScreen()),
    GetPage(name: Routes.SIGNIN, page: () => const SplashScreen()),

    /// App Home
    GetPage(name: Routes.MAINHOME, page: () => MainHome()),
    //dashboard
    GetPage(name: Routes.DASHBOARD, page: () => DashboardScreen()),
    GetPage(name: Routes.APPWASH_WALLET, page: () => AppWashWalletScreen()),
    GetPage(name: Routes.REWARDS, page: () => RewardsScreen()),
    GetPage(name: Routes.REFER_EARN, page: () => ReferEarnScreen()),
    GetPage(name: Routes.BOOKED_DETAILS, page: () => BookedDetailsScreen()),

    /// Booking
    GetPage(name: Routes.BOOKING, page: () => BookingScreen()),
    GetPage(
        name: Routes.SELECT_VEHICLE_BRAND,
        page: () => const SelectVehicleBrandScreen()),
    GetPage(
        name: Routes.VEHICLE_INFORMATION,
        page: () => VehicleInformationScreen()),
    GetPage(
        name: Routes.SELECT_A_LOCATION,
        page: () => const SelectLocationScreen()),

    /// Settings
    GetPage(
        name: Routes.ACCOUNT_DETAILS, page: () => const AccountDetailsScreen()),
    GetPage(name: Routes.MY_VEHICLES, page: () => const MyVehiclesScreen()),
    GetPage(
        name: Routes.BOOKING_HISTORY, page: () => const BookingHistoryScreen()),
    GetPage(name: Routes.ABOUT_US, page: () => const AboutUsScreen()),
    GetPage(
        name: Routes.PRIVACY_POLICY, page: () => const PrivacyPolicyScreen()),
    GetPage(
        name: Routes.HELP_AND_SUPPORT,
        page: () => const HelpAndSupportScreen()),
    GetPage(
        name: Routes.TERMS_AND_CONDITIONS,
        page: () => const TermsAndConditionsScreen()),
  ];
}
