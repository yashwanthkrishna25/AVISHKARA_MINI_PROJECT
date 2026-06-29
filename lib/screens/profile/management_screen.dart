// // lib/screens/profile/management_screen.dart
// import 'package:flutter/material.dart';
// import '../../core/theme/colors.dart';
// import '../../services/firebase_service.dart';
// import 'add_vehicle_screen.dart';

// class VehicleManagementScreen extends StatelessWidget {
//   const VehicleManagementScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary, 
//       appBar: AppBar(
//         title: const Text('Vehicle Management', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<List<Map<String, dynamic>>>(
//               stream: FirebaseService().streamVehicles(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator(color: AppColors.accent));
//                 }
//                 final vehicles = snapshot.data ?? [];
//                 if (vehicles.isEmpty) {
//                   return const Center(child: Text('No vehicles linked. Register one below!', style: TextStyle(color: Colors.white60)));
//                 }

//                 return ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: vehicles.length,
//                   itemBuilder: (context, index) {
//                     final vehicle = vehicles[index];
//                     bool isDefault = vehicle['status'] == 'Default';

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 16),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: isDefault 
//                               ? [const Color(0xFF1E3A8A), AppColors.accent] 
//                               : [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.05)],
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.white.withOpacity(0.2)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween, 
//                             children: [
//                               Text(vehicle['brand'] ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
//                               if (isDefault)
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), 
//                                   decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(10)),
//                                   child: const Text('Default', style: TextStyle(color: Colors.white, fontSize: 12)),
//                                 ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Text(vehicle['plate'] ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1)),
//                           const SizedBox(height: 10),
//                           Text(vehicle['owner'] ?? '', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14)),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(24),
//             decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, minimumSize: const Size.fromHeight(54), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
//               onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddVehicleScreen())),
//               icon: const Icon(Icons.add, color: Colors.white),
//               label: const Text('Add Vehicle', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


// lib/screens/profile/management_screen.dart
import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../services/firebase_service.dart';
import 'add_vehicle_screen.dart';

class VehicleManagementScreen extends StatelessWidget {
  const VehicleManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Vehicle Management', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: FirebaseService().streamVehicles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator(color: AppColors.accent));
                final vehicles = snapshot.data ?? [];
                if (vehicles.isEmpty) return const Center(child: Text('No vehicles registered.', style: TextStyle(color: Colors.white60)));

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: vehicles.length,
                  itemBuilder: (context, idx) {
                    final car = vehicles[idx];
                    bool isDef = car['status'] == 'Default';
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: isDef ? [const Color(0xFF1E3A8A), AppColors.accent] : [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.05)]),
                        borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text(car['brand'] ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            if (isDef) Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(10)), child: const Text('Default', style: TextStyle(color: Colors.white, fontSize: 12))),
                          ]),
                          const SizedBox(height: 10),
                          Text(car['plate'] ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1)),
                          const SizedBox(height: 10),
                          Text(car['owner'] ?? '', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14)),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, minimumSize: const Size.fromHeight(54), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddVehicleScreen())),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Add Vehicle', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}