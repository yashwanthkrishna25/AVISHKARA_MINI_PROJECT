import 'package:flutter/material.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  Widget bookingRow(String title, String value,
      {Color valueColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
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
        elevation: 0,
        centerTitle: true,
        title: const Text("Booking Successful"),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 10),

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

              const SizedBox(height: 20),

              const Text(
                "Booking Successful!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your parking slot has been reserved successfully.",
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

                      bookingRow(
                        "Booking ID",
                        "#PK20260001",
                      ),

                      const Divider(),

                      bookingRow(
                        "Parking",
                        "City Mall Parking",
                      ),

                      const Divider(),

                      bookingRow(
                        "Vehicle",
                        "TS09AB1234",
                      ),

                      const Divider(),

                      bookingRow(
                        "Slot",
                        "A1",
                      ),

                      const Divider(),

                      bookingRow(
                        "Date",
                        "29 June 2026",
                      ),

                      const Divider(),

                      bookingRow(
                        "Time",
                        "10:00 AM",
                      ),

                      const Divider(),

                      bookingRow(
                        "Duration",
                        "2 Hours",
                      ),

                      const Divider(),

                      bookingRow(
                        "Amount Paid",
                        "Rs. 94",
                        valueColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.payment),
                  label: const Text(
                    "Proceed to Payment",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/payment",
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}