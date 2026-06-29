import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/theme/colors.dart';

class BookingSuccessScreen extends StatelessWidget {
  final String targetTicketPayload = "PARK-Z-9848572";

  const BookingSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: AppColors.success, size: 70),
              const SizedBox(height: 16),
              const Text(
                "Booking Successful",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 8),
              const Text(
                "Present the system generated badge access key sequence at terminal checkpoint structures.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              QrImageView(
                data: targetTicketPayload,
                version: QrVersions.auto,
                size: 200.0,
                gapless: false,
              ),
              const SizedBox(height: 16),
              Text(
                targetTicketPayload,
                style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.of(context).popToRoot(), 
                child: const Text("Return Home Interface", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on NavigatorState {
  void popToRoot() {
    popUntil((route) => route.isFirst);
  }
}