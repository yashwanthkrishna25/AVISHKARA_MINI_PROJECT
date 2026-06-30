import 'package:flutter/material.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String slot =
        ModalRoute.of(context)?.settings.arguments as String? ?? "A1";

    const double pricePerHour = 40;
    const int hours = 2;

    final double subtotal = pricePerHour * hours;
    final double tax = subtotal * 0.18;
    final double total = subtotal + tax;

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Booking Summary"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [

                    summaryRow(
                      "Parking",
                      "City Mall Parking",
                    ),

                    const Divider(),

                    summaryRow(
                      "Vehicle",
                      "TS09AB1234",
                    ),

                    const Divider(),

                    summaryRow(
                      "Slot",
                      slot,
                    ),

                    const Divider(),

                    summaryRow(
                      "Date",
                      "29 June 2026",
                    ),

                    const Divider(),

                    summaryRow(
                      "Time",
                      "10:00 AM",
                    ),

                    const Divider(),

                    summaryRow(
                      "Duration",
                      "$hours Hours",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [

                    priceRow(
                      "Parking Fee",
                      "₹${subtotal.toStringAsFixed(0)}",
                    ),

                    const SizedBox(height: 12),

                    priceRow(
                      "GST (18%)",
                      "₹${tax.toStringAsFixed(0)}",
                    ),

                    const Divider(height: 30),

                    priceRow(
                      "Total",
                      "₹${total.toStringAsFixed(0)}",
                      bold: true,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle),
                label: const Text(
                  "Confirm Booking",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/booking-success",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summaryRow(String left, String right) {
    return Row(
      children: [

        Text(
          left,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        const Spacer(),

        Text(
          right,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget priceRow(
    String left,
    String right, {
    bool bold = false,
  }) {
    return Row(
      children: [

        Text(
          left,
          style: TextStyle(
            fontWeight:
                bold ? FontWeight.bold : FontWeight.normal,
            fontSize: bold ? 18 : 16,
          ),
        ),

        const Spacer(),

        Text(
          right,
          style: TextStyle(
            color: Colors.green,
            fontWeight:
                bold ? FontWeight.bold : FontWeight.normal,
            fontSize: bold ? 20 : 16,
          ),
        ),
      ],
    );
  }
}