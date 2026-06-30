import 'package:flutter/material.dart';

class BookingTicketScreen extends StatelessWidget {
  const BookingTicketScreen({super.key});

  Widget ticketRow(String title, String value) {
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
        title: const Text("Parking Ticket"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                const Icon(
                  Icons.qr_code_2,
                  size: 140,
                  color: Colors.black,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Show this ticket at the parking entrance",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),

                const Divider(height: 40),

                ticketRow("Booking ID", "#PK20260001"),
                ticketRow("Parking", "City Mall Parking"),
                ticketRow("Vehicle", "TS09AB1234"),
                ticketRow("Slot", "A12"),
                ticketRow("Date", "30 June 2026"),
                ticketRow("Time", "10:00 AM"),
                ticketRow("Duration", "2 Hours"),
                ticketRow("Amount", "Rs. 80"),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.download),
                    label: const Text("Download Ticket"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Download feature coming soon"),
                        ),
                      );
                    },
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