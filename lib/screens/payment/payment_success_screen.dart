import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  Widget infoRow(String title, String value,
      {Color valueColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Payment Successful"),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 20),

              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 70,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Payment Successful",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your parking slot has been booked successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      infoRow("Transaction ID", "TXN20260001"),

                      const Divider(),

                      infoRow("Booking ID", "#PK20260001"),

                      const Divider(),

                      infoRow("Parking", "City Mall Parking"),

                      const Divider(),

                      infoRow("Vehicle", "TS09AB1234"),

                      const Divider(),

                      infoRow("Slot", "A1"),

                      const Divider(),

                      infoRow("Duration", "2 Hours"),

                      const Divider(),

                      infoRow(
                        "Amount Paid",
                        "Rs. 94",
                        valueColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.home),
                  label: const Text(
                    "Back to Home",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/home",
                      (route) => false,
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.receipt_long),
                  label: const Text(
                    "View Booking",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      // "/booking-success",
                      "/booking-details",
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}