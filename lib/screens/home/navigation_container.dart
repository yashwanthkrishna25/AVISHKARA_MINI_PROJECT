// // lib/screens/home/navigation_container.dart
// import 'package:flutter/material.dart';
// import '../parking/map_screen_mock.dart'; 
// import '../profile/management_screen.dart';
// import '../booking/booking_history_screen.dart';
// import '../../core/theme/colors.dart';

// class NavigationContainer extends StatefulWidget {
//   const NavigationContainer({Key? key}) : super(key: key);

//   @override
//   State<NavigationContainer> createState() => _NavigationContainerState();
// }

// class _NavigationContainerState extends State<NavigationContainer> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     // Re-creating the viewports list directly inside the build method ensures 
//     // that every time setState() is called, the history screen reads the latest data!
//     final List<Widget> appViewports = [
//       const MapScreenMock(),
//       const VehicleManagementScreen(),
//       const BookingHistoryScreen(), // This will now reload fresh data maps
//     ];

//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex, 
//         children: appViewports,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Forces the IndexedStack view to re-render data properties
//           });
//         },
//         selectedItemColor: AppColors.accent,          
//         unselectedItemColor: AppColors.textSecondary,  
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.map_rounded),
//             label: 'Map',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.directions_car_rounded),
//             label: 'My Vehicles',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.confirmation_num_rounded),
//             label: 'Tickets',
//           ),
//         ],
//       ),
//     );
//   }
// }


// // lib/screens/home/navigation_container.dart
// import 'package:flutter/material.dart';
// import '../parking/map_screen_mock.dart'; 
// import '../profile/management_screen.dart';
// import '../booking/booking_history_screen.dart';
// import '../../core/theme/colors.dart';

// class NavigationContainer extends StatefulWidget {
//   const NavigationContainer({Key? key}) : super(key: key);

//   @override
//   State<NavigationContainer> createState() => _NavigationContainerState();
// }

// class _NavigationContainerState extends State<NavigationContainer> {
//   int _currentIndex = 0;

//   Widget _buildSelectedTab(int index) {
//     switch (index) {
//       case 0: return const MapScreenMock();
//       case 1: return const VehicleManagementScreen();
//       case 2: return const BookingHistoryScreen();
//       default: return const MapScreenMock();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildSelectedTab(_currentIndex),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, -4))]),
//         child: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (idx) => setState(() => _currentIndex = idx),
//           selectedItemColor: AppColors.accent,
//           unselectedItemColor: AppColors.textSecondary,
//           backgroundColor: Colors.white,
//           type: BottomNavigationBarType.fixed,
//           selectedFontSize: 12,
//           unselectedFontSize: 12,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.map_outlined), activeIcon: Icon(Icons.map_rounded), label: 'Map'),
//             BottomNavigationBarItem(icon: Icon(Icons.directions_car_outlined), activeIcon: Icon(Icons.directions_car_rounded), label: 'Vehicles'),
//             BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined), activeIcon: Icon(Icons.confirmation_num_rounded), label: 'Tickets'),
//           ],
//         ),
//       ),
//     );
//   }
// }



// lib/screens/home/navigation_container.dart
import 'package:flutter/material.dart';
import '../parking/map_screen_mock.dart'; 
import '../profile/management_screen.dart';
import '../booking/booking_history_screen.dart';
import '../../core/theme/colors.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _currentIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageStorage preserves scroll states and stream channels across tab updates
      body: PageStorage(
        bucket: _bucket,
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            MapScreenMock(key: PageStorageKey('MapTab')),
            VehicleManagementScreen(key: PageStorageKey('VehiclesTab')),
            BookingHistoryScreen(key: PageStorageKey('TicketsTab')),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, -4))],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (idx) => setState(() => _currentIndex = idx),
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.textSecondary,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.map_outlined), activeIcon: Icon(Icons.map_rounded), label: 'Map'),
            BottomNavigationBarItem(icon: Icon(Icons.directions_car_outlined), activeIcon: Icon(Icons.directions_car_rounded), label: 'Vehicles'),
            BottomNavigationBarItem(icon: Icon(Icons.confirmation_num_outlined), activeIcon: Icon(Icons.confirmation_num_rounded), label: 'Tickets'),
          ],
        ),
      ),
    );
  }
}