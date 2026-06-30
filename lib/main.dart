// import 'package:flutter/material.dart';
// import 'screens/auth/forgot_password_screen.dart';
// import 'screens/home/home_screen.dart';
// import 'screens/main/main_screen.dart';
// import 'screens/parking/parking_detail_screen.dart';
// import 'screens/parking/slot_selection_screen.dart';
// import 'screens/booking/booking_summary_screen.dart';
// import 'screens/booking/booking_success_screen.dart';
// import 'providers/vehicle_provider.dart';
// import 'screens/vehicles/vehicle_list_screen.dart';
// import 'screens/vehicles/add_vehicle_screen.dart';
// import 'screens/vehicles/edit_vehicle_screen.dart';
// import 'screens/payment/payment_method_screen.dart';
// import 'screens/payment/payment_success_screen.dart';


// import 'core/theme/app_theme.dart';
// import 'screens/auth/onboarding_screen.dart';
// import 'screens/auth/splash_screen.dart';
// import 'screens/auth/login_screen.dart';
// import 'screens/auth/register_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const ParkEaseApp());
// }

// class ParkEaseApp extends StatelessWidget {
//   const ParkEaseApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "ParkEase",
//       theme: AppTheme.lightTheme,
//       initialRoute: '/',
//       routes: {
//   '/': (context) => const SplashScreen(),
//   '/onboarding': (context) => const OnboardingScreen(),
//   '/login': (context) => LoginScreen(),
//   '/register': (_) => const RegisterScreen(),
//    '/forgot-password': (_) => const ForgotPasswordScreen(),
//    '/home': (_) => const HomeScreen(),
//    '/main': (_) => const MainScreen(),
//    '/parking-details': (_) =>
//     const ParkingDetailsScreen(),

// '/slot-selection': (_) =>
//     const SlotSelectionScreen(),

// '/booking-summary': (_) =>
//     const BookingSummaryScreen(),

// '/booking-success': (_) =>
//     const BookingSuccessScreen(),

// '/vehicles': (_) => const VehicleListScreen(),
// '/add-vehicle': (_) => const AddVehicleScreen(),
// '/edit-vehicle': (_) => const EditVehicleScreen(),
// '/payment': (_) => const PaymentMethodScreen(),
// '/payment-success': (_) => const PaymentSuccessScreen(),

// },
//     );
//   }
// }


import 'package:flutter/material.dart';

// AUTH
import 'screens/auth/splash_screen.dart';
import 'screens/auth/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/forgot_password_screen.dart';

import 'screens/profile/profile_screen.dart';
import 'screens/profile/edit_profile_screen.dart';
import 'screens/vehicles/vehicle_screen.dart';
import 'screens/booking/booking_history_screen.dart';
import 'screens/favorites/favorite_parking_screen.dart';
import 'screens/notifications/notification_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/help/help_support_screen.dart';
import 'screens/about/about_screen.dart';

// MAIN APP
import 'screens/home/home_screen.dart';
import 'screens/main/main_screen.dart';

// PARKING FLOW
import 'screens/parking/parking_detail_screen.dart';
import 'screens/parking/slot_selection_screen.dart';

// BOOKING
import 'screens/booking/booking_summary_screen.dart';
import 'screens/booking/booking_success_screen.dart';
import 'screens/booking/booking_details_screen.dart';
import 'screens/booking/booking_ticket_screen.dart';

// VEHICLES
import 'screens/vehicles/vehicle_list_screen.dart';
import 'screens/vehicles/add_vehicle_screen.dart';
import 'screens/vehicles/edit_vehicle_screen.dart';

// PAYMENT
import 'screens/payment/payment_method_screen.dart';
import 'screens/payment/payment_success_screen.dart';

// THEME
import 'core/theme/app_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ParkEaseApp());
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const ParkEaseApp());
// }

class ParkEaseApp extends StatelessWidget {
  const ParkEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ParkEase",

      theme: AppTheme.lightTheme,

      // START SCREEN
      initialRoute: '/',

      routes: {
        // AUTH FLOW
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),

        // MAIN
        '/home': (context) => const HomeScreen(),
        '/main': (context) => const MainScreen(),

        // PARKING FLOW
        '/parking-details': (context) => const ParkingDetailsScreen(),
        '/slot-selection': (context) => const SlotSelectionScreen(),

        // BOOKING FLOW
        '/booking-summary': (context) => const BookingSummaryScreen(),
        '/booking-success': (context) => const BookingSuccessScreen(),
        '/booking-details': (context) => const BookingDetailsScreen(),
        '/booking-ticket': (context) => const BookingTicketScreen(),
        
        
        // VEHICLES
        // '/vehicles': (context) => const VehicleListScreen(),
        '/add-vehicle': (context) => const AddVehicleScreen(),
        '/edit-vehicle': (context) => const EditVehicleScreen(),

        // PAYMENT
        '/payment': (context) => PaymentMethodScreen(),
        '/payment-success': (context) => const PaymentSuccessScreen(),


        '/edit-profile': (context) => const EditProfileScreen(),
'/vehicles': (context) => const VehicleScreen(),
'/booking-history': (context) => const BookingHistoryScreen(),
'/favorites': (context) => const FavoriteParkingScreen(),
'/notifications': (context) => const NotificationScreen(),
'/payment-methods': (context) => const PaymentMethodScreen(),
'/settings': (context) => const SettingsScreen(),
'/help': (context) => const HelpSupportScreen(),
'/about': (context) => const AboutScreen(),
      },
    );
  }
}