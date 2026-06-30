import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
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
        title: const Text("Booking Details"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                const Icon(
                  Icons.local_parking,
                  color: Colors.blue,
                  size: 80,
                ),

                const SizedBox(height: 20),

                const Text(
                  "City Mall Parking",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                detailRow("Booking ID", "#PK20260001"),
                detailRow("Vehicle", "TS09AB1234"),
                detailRow("Slot", "A12"),
                detailRow("Date", "30 June 2026"),
                detailRow("Time", "10:00 AM"),
                detailRow("Duration", "2 Hours"),
                detailRow("Amount", "Rs. 80"),
                detailRow("Status", "Active"),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.qr_code),
                    label: const Text("Show QR Ticket"),
                    onPressed: () {
  Navigator.pushNamed(
    context,
    "/booking-ticket",
  );
},
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.cancel),
                    label: const Text("Cancel Booking"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}