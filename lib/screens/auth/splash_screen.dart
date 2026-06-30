import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/onboarding");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.local_parking,
              size: 100,
              color: Colors.white,
            ),

            SizedBox(height: 20),

            Text(
              "ParkEase",
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Smart Parking Reservation",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}