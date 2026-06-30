import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 25),

            Center(
              child: Stack(
                children: [

                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Yashwanth Krishna",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "yashwanth@email.com",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        children: [
                          Icon(
                            Icons.local_parking,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "12",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Bookings"),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(
                            Icons.directions_car,
                            color: Colors.green,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "3",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Vehicles"),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "8",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Favorites"),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            buildMenu(
              Icons.person,
              "Edit Profile",
              () => Navigator.pushNamed(
                context,
                "/edit-profile",
              ),
            ),

            buildMenu(
              Icons.directions_car,
              "My Vehicles",
              () => Navigator.pushNamed(
                context,
                "/vehicles",
              ),
            ),

            buildMenu(
              Icons.history,
              "Booking History",
              () => Navigator.pushNamed(
                context,
                "/booking-history",
              ),
            ),

            buildMenu(
              Icons.favorite,
              "Favorite Parking",
              () => Navigator.pushNamed(
                context,
                "/favorites",
              ),
            ),

            buildMenu(
              Icons.notifications,
              "Notifications",
              () => Navigator.pushNamed(
                context,
                "/notifications",
              ),
            ),

            buildMenu(
              Icons.credit_card,
              "Payment Methods",
              () => Navigator.pushNamed(
                context,
                "/payment-methods",
              ),
            ),

            buildMenu(
              Icons.settings,
              "Settings",
              () => Navigator.pushNamed(
                context,
                "/settings",
              ),
            ),

            buildMenu(
              Icons.help_outline,
              "Help & Support",
              () => Navigator.pushNamed(
                context,
                "/help",
              ),
            ),

            buildMenu(
              Icons.info_outline,
              "About App",
              () => Navigator.pushNamed(
                context,
                "/about",
              ),
            ),

            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text("Dark Mode"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),

                      const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    showLogoutDialog();
                  },
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "ParkEase v1.0.0",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Made with ❤️ using Flutter",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildMenu(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Logout"),
          content: const Text(
            "Are you sure you want to logout from ParkEase?",
          ),
          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/login",
                  (route) => false,
                );
              },
              child: const Text("Logout"),
            ),

          ],
        );
      },
    );
  }
}