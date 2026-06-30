import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Help & Support"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [

                Icon(
                  Icons.support_agent,
                  size: 70,
                  color: Colors.white,
                ),

                SizedBox(height: 15),

                Text(
                  "How can we help you?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "We're here 24/7 to assist you.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          buildTile(
            Icons.call,
            "Call Support",
            "Talk with our support team",
            () {
              openUrl("tel:+919999999999");
            },
          ),

          buildTile(
            Icons.email,
            "Email Support",
            "support@parkease.com",
            () {
              openUrl(
                "mailto:support@parkease.com",
              );
            },
          ),

          buildTile(
            Icons.chat,
            "WhatsApp",
            "Instant Chat",
            () {
              openUrl(
                "https://wa.me/919999999999",
              );
            },
          ),

          buildTile(
            Icons.bug_report,
            "Report a Bug",
            "Found any issue?",
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Bug report feature coming soon.",
                  ),
                ),
              );
            },
          ),

          buildTile(
            Icons.feedback,
            "Send Feedback",
            "Help us improve",
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Feedback feature coming soon.",
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          const Text(
            "Frequently Asked Questions",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          ExpansionTile(
            leading: const Icon(Icons.help),
            title: const Text("How do I book a parking slot?"),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Go to Parking, choose a location, select a slot, make payment and confirm your booking.",
                ),
              ),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.payment),
            title: const Text("Can I cancel my booking?"),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Yes. Open Booking Details and tap Cancel Booking.",
                ),
              ),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.currency_rupee),
            title: const Text("Will I receive a refund?"),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Refunds depend on cancellation time and parking policy.",
                ),
              ),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.qr_code),
            title: const Text("How do I use my QR Ticket?"),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Show the QR Ticket at the parking entrance for verification.",
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildTile(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: onTap,
      ),
    );
  }
}