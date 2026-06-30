import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../widgets/parking_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Default location (Kadapa, Andhra Pradesh)
  final LatLng currentLocation = const LatLng(14.4673, 78.8242);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F6FF), // cleaner blue tint

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning 👋",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              "Find parking near you",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none),
          SizedBox(width: 15),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          /// SEARCH
          TextField(
            decoration: InputDecoration(
              hintText: "Search parking in India...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// MAP SECTION (REAL)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 250,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: currentLocation,
                  initialZoom: 13,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: 'com.example.parking_app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: currentLocation,
                        width: 50,
                        height: 50,
                        child: const Icon(
                          Icons.location_pin,
                          size: 45,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// LOCATION TEXT (REAL FEEL)
          const Text(
            "Current Location: Kadapa, Andhra Pradesh",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 25),

          const Text(
            "Featured Parking",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          const ParkingCard(
            name: "City Mall Parking",
            address: "Kadapa",
            price: "₹40/hr",
            slots: "120 Slots",
            rating: 4.8,
            distance: "1.2 km",
          ),

          const ParkingCard(
            name: "Railway Station Parking",
            address: "Kadapa Junction",
            price: "₹30/hr",
            slots: "85 Slots",
            rating: 4.5,
            distance: "2.6 km",
          ),

          const ParkingCard(
            name: "Bus Stand Parking",
            address: "APSRTC Kadapa",
            price: "₹25/hr",
            slots: "60 Slots",
            rating: 4.3,
            distance: "3.1 km",
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: _statCard("Available", "455", Colors.green),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _statCard("Booked", "128", Colors.red),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(Icons.local_offer, color: Colors.deepOrange, size: 40),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "Get 25% OFF on first booking in India launch offer!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}