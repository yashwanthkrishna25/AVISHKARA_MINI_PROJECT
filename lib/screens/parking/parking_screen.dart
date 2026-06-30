import 'package:flutter/material.dart';

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> parkingList = [
    {
      "name": "City Mall Parking",
      "location": "Hyderabad",
      "price": 40,
      "slots": 25,
      "rating": 4.8,
      "distance": "0.8 km",
      "icon": Icons.local_parking,
    },
    {
      "name": "Metro Parking",
      "location": "Secunderabad",
      "price": 30,
      "slots": 12,
      "rating": 4.5,
      "distance": "1.4 km",
      "icon": Icons.local_parking,
    },
    {
      "name": "Airport Parking",
      "location": "RGIA Airport",
      "price": 80,
      "slots": 42,
      "rating": 4.9,
      "distance": "5 km",
      "icon": Icons.local_parking,
    },
    {
      "name": "Railway Station Parking",
      "location": "Kacheguda",
      "price": 20,
      "slots": 8,
      "rating": 4.2,
      "distance": "2.1 km",
      "icon": Icons.local_parking,
    },
  ];

  List<Map<String, dynamic>> filteredParking = [];

  @override
  void initState() {
    super.initState();
    filteredParking = parkingList;
  }

  void searchParking(String value) {
    setState(() {
      filteredParking = parkingList.where((parking) {
        return parking["name"]
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            parking["location"]
                .toLowerCase()
                .contains(value.toLowerCase());
      }).toList();
    });
  }

  Widget buildChip(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(text),
        backgroundColor: Colors.blue.shade50,
      ),
    );
  }

  Widget parkingCard(Map<String, dynamic> parking) {
    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            Row(
              children: [

                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(
                    parking["icon"],
                    color: Colors.blue,
                    size: 32,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      Text(
                        parking["name"],
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        parking["location"],
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [

                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),

                    Text(
                      parking["rating"].toString(),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 18),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [

                infoTile(
                  Icons.attach_money,
                  "₹${parking["price"]}/hr",
                ),

                infoTile(
                  Icons.local_parking,
                  "${parking["slots"]} Slots",
                ),

                infoTile(
                  Icons.location_on,
                  parking["distance"],
                ),
              ],
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  "View Details",
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/parking-details",
                    arguments: parking,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoTile(IconData icon, String text) {
    return Column(
      children: [

        Icon(
          icon,
          color: Colors.blue,
        ),

        const SizedBox(height: 5),

        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Find Parking"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: searchController,
              onChanged: searchParking,
              decoration: InputDecoration(
                hintText: "Search parking...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildChip("Nearby"),
                  buildChip("Low Price"),
                  buildChip("High Rating"),
                  buildChip("EV Charging"),
                  buildChip("Covered"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: filteredParking.isEmpty
                  ? const Center(
                      child: Text(
                        "No Parking Found",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredParking.length,
                      itemBuilder: (context, index) {
                        return parkingCard(
                          filteredParking[index],
                        );
                      },
                    ),
            ),

          ],
        ),
      ),
    );
  }
}