// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'core/theme/colors.dart';
import 'providers/booking_provider.dart';
import 'services/auth_service.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/navigation_container.dart'; // Handles the main tabs and navigation

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase Web Connection Handshake
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAsKRkBNHx27jVmxoggWuEoUnXIALyBhiM",
      authDomain: "parkease-booking.firebaseapp.com",
      projectId: "parkease-booking",
      storageBucket: "parkease-booking.firebasestorage.app",
      messagingSenderId: "842366705987",
      appId: "1:842366705987:web:07c2c4731e4487a94ecff6",
      measurementId: "G-J30MZC7304",
    ),
  );
  
  runApp(const ParkEaseApp());
}

class ParkEaseApp extends StatelessWidget {
  const ParkEaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: MaterialApp(
        title: 'ParkEase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          fontFamily: 'Roboto',
        ),
        // If logged in, send directly to NavigationContainer which loads the Indian map locations
        home: StreamBuilder<User?>(
          stream: AuthService().userStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.hasData) {
              return const NavigationContainer(); // loads MapScreenMock with Indian points
            }
            return const LoginScreen(); 
          },
        ),
      ),
    );
  }
}