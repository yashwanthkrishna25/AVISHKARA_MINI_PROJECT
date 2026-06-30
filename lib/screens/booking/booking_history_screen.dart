import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = [
      {
        "parking": "City Mall Parking",
        "slot": "A12",
        "date": "12 Jul 2026",
        "price": "₹80",
        "status": "Completed",
      },
      {
        "parking": "Railway Station Parking",
        "slot": "B05",
        "date": "08 Jul 2026",
        "price": "₹60",
        "status": "Completed",
      },
      {
        "parking": "Airport Parking",
        "slot": "C18",
        "date": "01 Jul 2026",
        "price": "₹150",
        "status": "Cancelled",
      },
      {
        "parking": "IT Park Parking",
        "slot": "D09",
        "date": "28 Jun 2026",
        "price": "₹100",
        "status": "Completed",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        title: const Text("Booking History"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.local_parking,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          booking["parking"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  row("Slot", booking["slot"]!),
                  row("Date", booking["date"]!),
                  row("Amount", booking["price"]!),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Chip(
                      backgroundColor:
                          booking["status"] == "Completed"
                              ? Colors.green.shade100
                              : Colors.red.shade100,
                      label: Text(
                        booking["status"]!,
                        style: TextStyle(
                          color:
                              booking["status"] == "Completed"
                                  ? Colors.green
                                  : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.receipt_long),
                      label: const Text("View Booking"),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/booking-details",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}