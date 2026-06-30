// import 'package:flutter/material.dart';

// import '../booking/booking_screen.dart';
// import '../home/home_screen.dart';
// import '../parking/parking_screen.dart';
// import '../profile/profile_screen.dart';
// import '../vehicles/vehicle_screen.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int currentIndex = 0;

//   final List<Widget> pages = const [
//     HomeScreen(),
//     ParkingScreen(),
//     BookingScreen(),
//     VehicleScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],

//       bottomNavigationBar: NavigationBar(
//         selectedIndex: currentIndex,

//         onDestinationSelected: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },

//         destinations: const [
//           NavigationDestination(
//             icon: Icon(Icons.home_outlined),
//             selectedIcon: Icon(Icons.home),
//             label: "Home",
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.local_parking_outlined),
//             selectedIcon: Icon(Icons.local_parking),
//             label: "Parking",
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.receipt_long_outlined),
//             selectedIcon: Icon(Icons.receipt_long),
//             label: "Bookings",
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.directions_car_outlined),
//             selectedIcon: Icon(Icons.directions_car),
//             label: "Vehicles",
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.person_outline),
//             selectedIcon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../booking/booking_screen.dart';
import '../home/home_screen.dart';
import '../parking/parking_screen.dart';
import '../profile/profile_screen.dart';
import '../vehicles/vehicle_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ParkingScreen(),
    BookingScreen(),
    VehicleScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 72,
          backgroundColor: Colors.white,
          indicatorColor: Colors.green.shade100,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          animationDuration: const Duration(milliseconds: 500),
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.local_parking_outlined),
              selectedIcon: Icon(
                Icons.local_parking,
                color: Colors.green,
              ),
              label: "Parking",
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(
                Icons.receipt_long,
                color: Colors.green,
              ),
              label: "Bookings",
            ),
            NavigationDestination(
              icon: Icon(Icons.directions_car_outlined),
              selectedIcon: Icon(
                Icons.directions_car,
                color: Colors.green,
              ),
              label: "Vehicles",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(
                Icons.person,
                color: Colors.green,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}