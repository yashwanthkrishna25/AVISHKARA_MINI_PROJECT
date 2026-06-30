import 'package:flutter/material.dart';

class ParkingCard extends StatelessWidget {
  final String name;
  final String address;
  final String price;
  final String slots;
  final double rating;
  final String distance;
  final bool isOpen;

  const ParkingCard({
    super.key,
    required this.name,
    required this.address,
    required this.price,
    required this.slots,
    required this.rating,
    this.distance = "1.2 km",
    this.isOpen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Top Row
            Row(
              children: [

                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.local_parking,
                    color: Colors.blue,
                    size: 45,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      Text(
                        name,
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
                            color: Colors.red,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              address,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [

                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 18,
                          ),

                          const SizedBox(width: 4),

                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Icon(
                            Icons.route,
                            size: 18,
                            color: Colors.blue,
                          ),

                          const SizedBox(width: 4),

                          Text(distance),
                        ],
                      ),
                    ],
                  ),
                ),

                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 18),

            const Divider(),

            const SizedBox(height: 8),

            /// Info Row
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  children: [

                    const Icon(
                      Icons.local_parking,
                      color: Colors.green,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      slots,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [

                    const Icon(
                      Icons.currency_rupee,
                      color: Colors.orange,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [

                    Icon(
                      Icons.circle,
                      size: 14,
                      color: isOpen
                          ? Colors.green
                          : Colors.red,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      isOpen ? "Open" : "Closed",
                      style: TextStyle(
                        color: isOpen
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.local_parking),
                label: const Text(
                  "Book Now",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/parking-details",
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