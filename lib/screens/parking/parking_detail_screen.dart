// import 'package:flutter/material.dart';
// import '../../core/constants/app_colors.dart';

// class ParkingDetailsScreen extends StatelessWidget {
//   const ParkingDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F7FA),

//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             /// IMAGE HEADER
//             Container(
//               height: 240,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.grey,
//               ),
//               child: const Center(
//                 child: Icon(
//                   Icons.local_parking,
//                   size: 80,
//                   color: Colors.white,
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   /// TITLE + RATING
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text(
//                         "City Mall Parking",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Icon(Icons.star, color: Colors.orange),
//                           SizedBox(width: 4),
//                           Text("4.6"),
//                         ],
//                       )
//                     ],
//                   ),

//                   const SizedBox(height: 6),

//                   const Text(
//                     "123 Main Road, Warangal",
//                     style: TextStyle(color: Colors.grey),
//                   ),

//                   const SizedBox(height: 20),

//                   /// INFO ROW
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       _InfoBox(title: "Price", value: "₹40/hr"),
//                       _InfoBox(title: "Slots", value: "120"),
//                       _InfoBox(title: "Open", value: "24/7"),
//                     ],
//                   ),

//                   const SizedBox(height: 25),

//                   /// LIVE SLOT STATUS
//                   const Text(
//                     "Live Slot Status",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   Wrap(
//                     spacing: 10,
//                     runSpacing: 10,
//                     children: List.generate(9, (index) {
//                       bool isBooked = index % 3 == 0;

//                       return Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: isBooked
//                               ? Colors.red.shade100
//                               : Colors.green.shade100,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("S${index + 1}"),
//                         ),
//                       );
//                     }),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ACTION BUTTON
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primary,
//                       ),
//                       onPressed: () {
//                         Navigator.pushNamed(context, "/slotBooking");
//                       },
//                       child: const Text("Continue to Booking"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _InfoBox extends StatelessWidget {
//   final String title;
//   final String value;

//   const _InfoBox({
//     required this.title,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ParkingDetailsScreen extends StatelessWidget {
  const ParkingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.blue,

            flexibleSpace: FlexibleSpaceBar(
              title: const Text("City Mall Parking"),
              background: Image.network(
                "https://images.unsplash.com/photo-1506521781263-d8422e82f27a?w=1200",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: const [

                      Icon(Icons.location_on,
                          color: Colors.red),

                      SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          "Hanamkonda, Warangal",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: const [

                      Icon(Icons.star,
                          color: Colors.orange),

                      SizedBox(width: 5),

                      Text(
                        "4.8",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Spacer(),

                      Text(
                        "₹40 / Hour",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Facilities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [

                      facility(Icons.security, "24x7 Security"),

                      facility(Icons.camera_alt, "CCTV"),

                      facility(Icons.ev_station, "EV Charging"),

                      facility(Icons.local_parking, "Covered"),

                      facility(Icons.wifi, "WiFi"),

                      facility(Icons.accessible, "Accessible"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "About",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "City Mall Parking offers secure parking with CCTV monitoring, EV charging, covered parking, and easy access to shopping malls.",
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: const [

                        Icon(Icons.local_parking,
                            size: 45,
                            color: Colors.green),

                        SizedBox(width: 20),

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Available Slots",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "120 / 180",
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/slot-selection",
                        );
                      },
                      child: const Text(
                        "Book Parking",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget facility(
      IconData icon,
      String title,
      ) {
    return Chip(
      avatar: Icon(
        icon,
        color: Colors.blue,
      ),
      label: Text(title),
      padding: const EdgeInsets.all(8),
    );
  }
}