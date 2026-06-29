// // lib/screens/parking/map_screen_mock.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'dart:math'; // Required for random slot allocation and ID generation
// import '../../core/theme/colors.dart';
// import '../../services/firebase_service.dart'; // Real-time Firebase operations service
// import '../booking/ticket_screen.dart'; // Targets layout for the generated ticket overlay

// class MapScreenMock extends StatelessWidget {
//   const MapScreenMock({Key? key}) : super(key: key);

//   // Focuses map frame coordinates over center Hyderabad, India layout zones
//   final LatLng initialCenter = const LatLng(17.4483, 78.3741);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FlutterMap(
//             options: MapOptions(
//               initialCenter: initialCenter,
//               initialZoom: 13.0, 
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                 userAgentPackageName: 'com.parkease.app',
//               ),

//               // Active map location marker pins mapped onto layout canvas
//               MarkerLayer(
//                 markers: [
//                   _buildMarker(
//                     context,
//                     const LatLng(17.4435, 78.3772), // Cyber Towers Station
//                     "Hitech City Smart Parking",
//                     AppColors.accent,
//                   ),
//                   _buildMarker(
//                     context,
//                     const LatLng(17.4192, 78.3490), // Gachibowli Stadium Lot
//                     "Gachibowli Parking Hub",
//                     AppColors.primary,
//                   ),
//                   _buildMarker(
//                     context,
//                     const LatLng(17.4841, 78.3889), // Kukatpally Transit Zone
//                     "Kukatpally Commercial Zone",
//                     Colors.green,
//                   ),
//                   _buildMarker(
//                     context,
//                     const LatLng(17.4932, 78.3499), // Miyapur Metro Yard
//                     "Miyapur Metro Transit Lot",
//                     Colors.blue,
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           // Floating Top Header Search Field Panel Container
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 8,
//                       offset: Offset(0, 3),
//                     )
//                   ],
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search parking zones in Hyderabad...",
//                     prefixIcon: const Icon(Icons.search, color: AppColors.primary),
//                     filled: true,
//                     fillColor: Colors.transparent,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Location indicator interactive builder element
//   Marker _buildMarker(
//     BuildContext context,
//     LatLng point,
//     String name,
//     Color color,
//   ) {
//     return Marker(
//       point: point,
//       width: 80,
//       height: 80,
//       child: GestureDetector(
//         onTap: () => _showParkingDetailsSummary(context, name),
//         child: Icon(
//           Icons.location_on_rounded,
//           color: color,
//           size: 46,
//         ),
//       ),
//     );
//   }

//   // Modal drawer presenting pricing updates and active checkout buttons
//   void _showParkingDetailsSummary(BuildContext context, String name) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               const Row(
//                 children: [
//                   Icon(Icons.location_on, size: 16, color: Colors.grey),
//                   SizedBox(width: 4),
//                   Text(
//                     "Hyderabad, Telangana, India",
//                     style: TextStyle(color: Colors.grey, fontSize: 14),
//                   ),
//                 ],
//               ),
//               const Divider(height: 32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "₹30 / hr",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       Text(
//                         "Available Spots: 18 left",
//                         style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500),
//                       )
//                     ],
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.accent,
//                       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     onPressed: () async {
//                       Navigator.pop(context); // Close details drawer panel natively

//                       // Trigger loading message pipeline stream indicators
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Processing remote booking transaction...'),
//                           duration: Duration(seconds: 1),
//                         ),
//                       );

//                       try {
//                         // 1. Await real-time stream snapshot array maps from Firebase Cloud Firestore
//                         final List<Map<String, dynamic>> userVehiclesSnapshot = 
//                             await FirebaseService().streamVehicles().first;
                        
//                         // 2. Scan array to select the marked Default plate, matching types safely
//                         String selectedPlate = 'TS-09-EA-1234'; // Default placeholder safety
//                         if (userVehiclesSnapshot.isNotEmpty) {
//                           final defaultCar = userVehiclesSnapshot.firstWhere(
//                             (v) => v['status'] == 'Default',
//                             orElse: () => userVehiclesSnapshot.first,
//                           );
//                           selectedPlate = (defaultCar['plate'] ?? 'TS-09-EA-1234').toString();
//                         }

//                         // 3. Compile a strictly type-casted transmission Map payload
//                         final String generatedId = "PKZ-${Random().nextInt(900000) + 100000}";
//                         final Map<String, dynamic> newBookingEntry = {
//                           'id': generatedId,
//                           'facility': name.toString(),
//                           'slot': 'P-${Random().nextInt(40) + 1}',
//                           'plate': selectedPlate,
//                           'time': 'Today, 2 Hour Window',
//                           'amount': '₹30',
//                           'status': 'active'
//                         };

//                         // 4. Fire async write execution directly into Firebase databases
//                         await FirebaseService().saveBooking(newBookingEntry);

//                         // 5. Explicitly check if widget state context remains active before routing forward
//                         if (context.mounted) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => TicketScreen(bookingDetails: newBookingEntry),
//                             ),
//                           );
//                         }
//                       } catch (e) {
//                         // Exception response message capture catch engine
//                         if (context.mounted) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Database Operation Failed: $e'), 
//                               backgroundColor: Colors.redAccent,
//                             ),
//                           );
//                         }
//                       }
//                     },
//                     child: const Text(
//                       "Book Spot",
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



// lib/screens/parking/map_screen_mock.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';
import '../../core/theme/colors.dart';
import '../../services/firebase_service.dart';
import '../booking/ticket_screen.dart';

class MapScreenMock extends StatelessWidget {
  const MapScreenMock({Key? key}) : super(key: key);

  final LatLng initialCenter = const LatLng(17.4483, 78.3741); // Hyderabad IT Corridor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(initialCenter: initialCenter, initialZoom: 13.0),
            children: [
              TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.parkease.app'),
              MarkerLayer(
                markers: [
                  _marker(context, const LatLng(17.4435, 78.3772), "Hitech City Smart Parking", AppColors.accent),
                  _marker(context, const LatLng(17.4192, 78.3490), "Gachibowli Parking Hub", AppColors.primary),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)]),
                child: const TextField(
  decoration: InputDecoration(
    hintText: "Search parking locations...", 
    prefixIcon: Icon(Icons.search, color: AppColors.primary), 
    border: InputBorder.none, // 💡 Changed from BorderSide.none to InputBorder.none
  ),
),
              ),
            ),
          )
        ],
      ),
    );
  }

  Marker _marker(BuildContext context, LatLng pt, String name, Color col) {
    return Marker(point: pt, width: 60, height: 60, child: GestureDetector(onTap: () => _openCheckoutSheet(context, name), child: Icon(Icons.location_on_rounded, color: col, size: 44)));
  }

  void _openCheckoutSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 6),
              const Row(children: [Icon(Icons.location_on, size: 16, color: Colors.grey), SizedBox(width: 4), Text("Hyderabad, India")]),
              const Divider(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("₹30 / hr", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary)), Text("18 Spots Available", style: TextStyle(color: Colors.green, fontSize: 12))]),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    onPressed: () async {
                      Navigator.pop(context);
                      final vehicles = await FirebaseService().streamVehicles().first;
                      String defaultPlate = vehicles.isNotEmpty ? (vehicles.firstWhere((v) => v['status'] == 'Default', orElse: () => vehicles.first)['plate'] ?? 'TS-09-EA-1234') : 'TS-09-EA-1234';
                      
                      final String ticketId = "PKZ-${Random().nextInt(900000) + 100000}";
                      final Map<String, dynamic> ticketData = {'id': ticketId, 'facility': title, 'slot': 'P-${Random().nextInt(40) + 1}', 'plate': defaultPlate, 'time': 'Today, 2 Hours', 'amount': '₹30', 'status': 'active'};
                      
                      await FirebaseService().saveBooking(ticketData);
                      if (context.mounted) Navigator.push(context, MaterialPageRoute(builder: (_) => TicketScreen(bookingDetails: ticketData)));
                    },
                    child: const Text("Book Spot", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}