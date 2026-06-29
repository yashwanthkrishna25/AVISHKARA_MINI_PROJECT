// import 'package:flutter/material.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../models/vehicle_model.dart';

// class VehicleManagementScreen extends StatefulWidget {
//   const VehicleManagementScreen({super.key});

//   @override
//   State<VehicleManagementScreen> createState() => _VehicleManagementScreenState();
// }

// class _VehicleManagementScreenState extends State<VehicleManagementScreen> {
//   // Mock listing matching the exact visual layouts from your mockup image
//   final List<Vehicle> _myVehicles = [
//     Vehicle(
//       id: '1',
//       brand: 'KIA',
//       licensePlate: '75A-165.19',
//       phoneNumber: '+0349214387',
//       ownerName: 'Trần Ngọc Thắng',
//       isDefault: true,
//       cardColor: AppColors.primaryDarkBlue,
//     ),
//     Vehicle(
//       id: '2',
//       brand: 'KIA',
//       licensePlate: '75A-165.10',
//       phoneNumber: '+0123456789',
//       ownerName: 'Trần Ngọc Thắng',
//       isDefault: false,
//       cardColor: AppColors.primaryOrange,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundLight,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryDarkBlue),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Quản lý phương tiện',
//           style: TextStyle(color: AppColors.primaryDarkBlue, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(20),
//         itemCount: _myVehicles.length,
//         itemBuilder: (context, index) {
//           final vehicle = _myVehicles[index];
//           return Container(
//             margin: const EdgeInsets.only(bottom: 20),
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: vehicle.cardColor,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: AppColors.tightShadow,
//               gradient: LinearGradient(
//                 colors: [vehicle.cardColor, vehicle.cardColor.withOpacity(0.85)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           vehicle.brand,
//                           style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.black, letterSpacing: 1.2),
//                         ),
//                         Text(
//                           'Biển số: ${vehicle.licensePlate}',
//                           style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                     if (vehicle.isDefault)
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: const Text(
//                           'Mặc định',
//                           style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(height: 32),
//                 Text(
//                   vehicle.ownerName,
//                   style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       vehicle.phoneNumber,
//                       style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
//                     ),
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit_note, color: Colors.white),
//                           onPressed: () {
//                             // Edit action sheet logic
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete_outline, color: Colors.white),
//                           onPressed: () {
//                             // Delete record operation logic
//                           },
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           child: ElevatedButton.icon(
//             onPressed: () {
//               // Action sheet to create a vehicle document
//             },
//             icon: const Icon(Icons.add, color: Colors.white),
//             label: const Text('Thêm phương tiện', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.accentBlue,
//               minimumSize: const Size(double.infinity, 56),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               elevation: 0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }