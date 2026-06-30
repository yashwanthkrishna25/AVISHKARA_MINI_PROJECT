import 'package:flutter/material.dart';

class FavoriteParkingScreen extends StatelessWidget {
  const FavoriteParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = [
      {
        "name": "City Mall Parking",
        "location": "Warangal",
        "price": "₹40/hr",
        "rating": "4.8",
      },
      {
        "name": "Railway Station Parking",
        "location": "Hanamkonda",
        "price": "₹30/hr",
        "rating": "4.6",
      },
      {
        "name": "Airport Parking",
        "location": "Hyderabad",
        "price": "₹60/hr",
        "rating": "4.9",
      },
      {
        "name": "IT Park Parking",
        "location": "Madhapur",
        "price": "₹50/hr",
        "rating": "4.7",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Favorite Parking"),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final parking = favorites[index];

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

                      Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.local_parking,
                          color: Colors.blue,
                          size: 35,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              parking["name"]!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(parking["location"]!),
                              ],
                            ),

                            const SizedBox(height: 6),

                            Row(
                              children: [

                                Icon(
                                  Icons.star,
                                  color: Colors.amber.shade700,
                                  size: 18,
                                ),

                                const SizedBox(width: 4),

                                Text(parking["rating"]!),
                              ],
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [

                      Text(
                        parking["price"]!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      const Spacer(),

                      ElevatedButton.icon(
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Book"),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/parking-details",
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}