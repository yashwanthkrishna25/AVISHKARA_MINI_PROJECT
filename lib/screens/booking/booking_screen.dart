import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("My Bookings"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          BookingCard(
            parkingName: "City Mall Parking",
            location: "Warangal",
            slot: "A12",
            date: "30 Jun 2026",
            time: "10:00 AM",
            status: "Active",
            amount: "₹80",
          ),

          SizedBox(height: 16),

          BookingCard(
            parkingName: "Railway Station Parking",
            location: "Kazipet",
            slot: "B05",
            date: "25 Jun 2026",
            time: "04:30 PM",
            status: "Completed",
            amount: "₹60",
          ),

          SizedBox(height: 16),

          BookingCard(
            parkingName: "Airport Parking",
            location: "Hyderabad",
            slot: "C18",
            date: "20 Jun 2026",
            time: "08:00 AM",
            status: "Cancelled",
            amount: "₹120",
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String parkingName;
  final String location;
  final String slot;
  final String date;
  final String time;
  final String status;
  final String amount;

  const BookingCard({
    super.key,
    required this.parkingName,
    required this.location,
    required this.slot,
    required this.date,
    required this.time,
    required this.status,
    required this.amount,
  });

  Color get statusColor {
    switch (status) {
      case "Active":
        return Colors.green;
      case "Completed":
        return Colors.blue;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Row(
              children: [
                const Icon(
                  Icons.local_parking,
                  color: Colors.blue,
                  size: 34,
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        parkingName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Chip(
                  label: Text(status),
                  backgroundColor: statusColor.withOpacity(.15),
                  labelStyle: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Divider(height: 28),

            Row(
              children: [
                const Icon(Icons.event, size: 18),
                const SizedBox(width: 8),
                Text(date),

                const Spacer(),

                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 8),
                Text(time),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.confirmation_num, size: 18),
                const SizedBox(width: 8),
                Text("Slot $slot"),

                const Spacer(),

                Text(
                  amount,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/booking-details",
                  );
                },
                child: const Text("View Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}