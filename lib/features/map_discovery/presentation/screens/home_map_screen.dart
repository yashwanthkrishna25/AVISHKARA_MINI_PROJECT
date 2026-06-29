// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong2.dart';
// import '../../../../core/constants/app_colors.dart';

// class HomeMapScreen extends StatefulWidget {
//   const HomeMapScreen({super.key});

//   @override
//   State<HomeMapScreen> createState() => _HomeMapScreenState();
// }

// class _HomeMapScreenState extends State<HomeMapScreen> {
//   // Center coordinates for the map (e.g., Ho Chi Minh City/Tôn Đức Thắng University area from design)
//   final LatLng _centerLocation = const LatLng(10.7326, 106.6994);
//   final MapController _mapController = MapController();

//   // Mock data for parking spots matching the floating cards look
//   final List<Map<String, dynamic>> _mockParkingSpots = [
//     {
//       'name': 'Phố đi bộ Nguyễn Huệ',
//       'rating': '4.6 ★',
//       'price': '10,000đ / Giờ',
//       'type': 'Trở sảnh | Xe máy | Ô tô',
//       'coordinates': const LatLng(10.7340, 106.7010),
//     },
//     {
//       'name': 'Vincom Center Q1',
//       'rating': '4.8 ★',
//       'price': '15,000đ / Giờ',
//       'type': 'Trở sảnh | Ô tô',
//       'coordinates': const LatLng(10.7310, 106.6975),
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // 1. OPENSTREETMAP LAYER
//           FlutterMap(
//             mapController: _mapController,
//             options: MapOptions(
//               initialCenter: _centerLocation,
//               initialZoom: 15.0,
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate: 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png',
//                 subdomains: const ['a', 'b', 'c', 'd'],
//               ),
//               MarkerLayer(
//                 markers: _mockParkingSpots.map((spot) {
//                   return Marker(
//                     point: spot['coordinates'],
//                     width: 45,
//                     height: 45,
//                     child: GestureDetector(
//                       onTap: () {
//                         // Logic to slide/scroll to the matching card
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryOrange,
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.white, width: 3),
//                           boxShadow: AppColors.tightShadow,
//                         ),
//                         child: const Icon(
//                           Icons.local_parking,
//                           color: Colors.white,
//                           size: 22,
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),

//           // 2. TOP HEADERS & SEARCH BAR
//           Positioned(
//             top: 50,
//             left: 16,
//             right: 16,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on, color: AppColors.primaryDarkBlue),
//                         const SizedBox(width: 8),
//                         Text(
//                           'Đại học Tôn Đức Thắng',
//                           style: TextStyle(
//                             color: AppColors.primaryDarkBlue.withOpacity(0.9),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: Icon(Icons.notifications_none, color: AppColors.primaryDarkBlue),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 // Search Bar
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: AppColors.tightShadow,
//                   ),
//                   child: const TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Tìm kiếm bãi đỗ xe...',
//                       border: InputBorder.none,
//                       icon: Icon(Icons.search, color: AppColors.textMuted),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // 3. HORIZONTAL SCROLLING PARKING CARDS
//           Positioned(
//             bottom: 24,
//             left: 0,
//             right: 0,
//             child: SizedBox(
//               height: 140,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: _mockParkingSpots.length,
//                 itemBuilder: (context, index) {
//                   final spot = _mockParkingSpots[index];
//                   return Container(
//                     width: MediaQuery.of(context).size.width * 0.75,
//                     margin: const EdgeInsets.only(right: 16),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: AppColors.tightShadow,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 80,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const Icon(Icons.image, color: Colors.grey),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 spot['name'],
//                                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(height: 4),
//                               Text(spot['type'], style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
//                               const SizedBox(height: 8),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     spot['price'],
//                                     style: const TextStyle(color: AppColors.primaryOrange, fontWeight: FontWeight.bold),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                                     decoration: BoxDecoration(color: Colors.amber[100], borderRadius: BorderRadius.circular(6)),
//                                     child: Text(spot['rating'], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }