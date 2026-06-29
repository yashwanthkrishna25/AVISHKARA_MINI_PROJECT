// // lib/screens/booking/booking_history_screen.dart
// import 'package:flutter/material.dart';
// import '../../core/theme/colors.dart';
// import '../../services/mock_data_service.dart'; 

// class BookingHistoryScreen extends StatefulWidget {
//   const BookingHistoryScreen({Key? key}) : super(key: key);

//   @override
//   State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
// }

// class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // Reads directly from the persistent data model array on layout load
//     final historyList = MockDataService.bookings;

//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(
//         title: const Text('My Tickets', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         automaticallyImplyLeading: false, 
//       ),
//       body: historyList.isEmpty
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.confirmation_number_outlined, size: 64, color: Colors.white.withOpacity(0.3)),
//                   const SizedBox(height: 16),
//                   Text('No active bookings found.', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16)),
//                 ],
//               ),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: historyList.length,
//               itemBuilder: (context, index) {
//                 final item = historyList[index];
//                 final bool isActive = item['status'] == 'active';

//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 14),
//                   padding: const EdgeInsets.all(18),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.08),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.white.withOpacity(0.12)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(item['facility'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
//                             const SizedBox(height: 6),
//                             Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                                   decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.15), borderRadius: BorderRadius.circular(6)),
//                                   child: Text(item['slot'], style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 12)),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text('Plate: ${item['plate']}', style: const TextStyle(color: Colors.white70, fontSize: 13)),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                             Text(item['time'], style: const TextStyle(color: Colors.white38, fontSize: 11)),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(item['amount'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
//                           const SizedBox(height: 8),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: isActive ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               isActive ? 'ACTIVE' : 'COMPLETED',
//                               style: TextStyle(color: isActive ? Colors.greenAccent : Colors.white60, fontSize: 10, fontWeight: FontWeight.bold),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }


// // lib/screens/booking/booking_history_screen.dart
// import 'package:flutter/material.dart';
// import '../../core/theme/colors.dart';
// import '../../services/firebase_service.dart';

// class BookingHistoryScreen extends StatefulWidget {
//   const BookingHistoryScreen({Key? key}) : super(key: key);

//   @override
//   State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
// }

// class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary, // Premium Midnight Dark Blue
//       appBar: AppBar(
//         title: const Text(
//           'My Tickets', 
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         automaticallyImplyLeading: false, 
//       ),
//       body: StreamBuilder<List<Map<String, dynamic>>>(
//         stream: FirebaseService().streamBookings(),
//         builder: (context, snapshot) {
//           // 1. Show loading wheel while waiting for data connection properties
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator(color: AppColors.accent));
//           }

//           final historyList = snapshot.data ?? [];

//           // 2. Safe interface fallback wrapper if array remains empty
//           if (historyList.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.confirmation_number_outlined, 
//                     size: 64, 
//                     color: Colors.white.withOpacity(0.2),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'No active bookings found.', 
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.6), 
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }

//           // 3. Render list views cleanly when tracking logs populate
//           return ListView.builder(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//             itemCount: historyList.length,
//             itemBuilder: (context, index) {
//               final item = historyList[index];
//               final bool isActive = item['status'] == 'active';

//               return Container(
//                 margin: const EdgeInsets.only(bottom: 16),
//                 padding: const EdgeInsets.all(18),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.06),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.white.withOpacity(0.1)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             (item['facility'] ?? 'Smart Parking Facility').toString(), 
//                             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), 
//                             maxLines: 1, 
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), 
//                                 decoration: BoxDecoration(
//                                   color: AppColors.accent.withOpacity(0.15), 
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   (item['slot'] ?? 'P-00').toString(), 
//                                   style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 12),
//                                 ),
//                               ),
//                               const SizedBox(width: 10),
//                               Text(
//                                 'Plate: ${item['plate'] ?? "N/A"}', 
//                                 style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             (item['time'] ?? 'Active Session').toString(), 
//                             style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           (item['amount'] ?? '₹30').toString(), 
//                           style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
//                         ),
//                         const SizedBox(height: 10),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: isActive ? Colors.green.withOpacity(0.15) : Colors.grey.withOpacity(0.15),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Text(
//                             isActive ? 'ACTIVE' : 'COMPLETED',
//                             style: TextStyle(
//                               color: isActive ? Colors.greenAccent : Colors.white60, 
//                               fontSize: 10, 
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


// lib/screens/booking/booking_history_screen.dart
import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../services/firebase_service.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('My Tickets', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, 
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: FirebaseService.localBookingsNotifier,
        builder: (context, localHistory, _) {
          
          // Fallback UI if no items are populated
          if (localHistory.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.confirmation_number_outlined, size: 64, color: Colors.white.withOpacity(0.2)),
                  const SizedBox(height: 16),
                  Text(
                    'No active bookings found.', 
                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            itemCount: localHistory.length,
            itemBuilder: (context, index) {
              final item = localHistory[index];
              final bool isActive = item['status'] == 'active';

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (item['facility'] ?? 'Smart Parking Facility').toString(), 
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), 
                            maxLines: 1, 
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), 
                                decoration: BoxDecoration(
                                  color: AppColors.accent.withOpacity(0.15), 
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  (item['slot'] ?? 'P-00').toString(), 
                                  style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Plate: ${item['plate'] ?? "N/A"}', 
                                style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            (item['time'] ?? 'Active Session').toString(), 
                            style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (item['amount'] ?? '₹30').toString(), 
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isActive ? Colors.green.withOpacity(0.15) : Colors.grey.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            isActive ? 'ACTIVE' : 'COMPLETED',
                            style: TextStyle(
                              color: isActive ? Colors.greenAccent : Colors.white60, 
                              fontSize: 10, 
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}