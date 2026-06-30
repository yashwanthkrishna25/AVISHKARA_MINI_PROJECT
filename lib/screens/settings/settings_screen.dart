import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;
  bool fingerprint = false;
  bool location = true;

  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [

                Icon(
                  Icons.settings,
                  size: 70,
                  color: Colors.white,
                ),

                SizedBox(height: 15),

                Text(
                  "Application Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Customize your ParkEase experience",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "General",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [

                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text("Dark Mode"),
                  subtitle: const Text("Enable dark theme"),
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(Icons.notifications),
                  title: const Text("Notifications"),
                  subtitle: const Text("Booking & payment alerts"),
                  value: notifications,
                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(Icons.fingerprint),
                  title: const Text("Fingerprint Login"),
                  subtitle: const Text("Secure authentication"),
                  value: fingerprint,
                  onChanged: (value) {
                    setState(() {
                      fingerprint = value;
                    });
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(Icons.location_on),
                  title: const Text("Location Access"),
                  subtitle: const Text("Find nearby parking"),
                  value: location,
                  onChanged: (value) {
                    setState(() {
                      location = value;
                    });
                  },
                ),

              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Language",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButtonFormField<String>(
                value: selectedLanguage,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.language),
                ),
                items: const [

                  DropdownMenuItem(
                    value: "English",
                    child: Text("English"),
                  ),

                  DropdownMenuItem(
                    value: "Hindi",
                    child: Text("Hindi"),
                  ),

                  DropdownMenuItem(
                    value: "Telugu",
                    child: Text("Telugu"),
                  ),

                ],
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Security",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [

                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text("Privacy Policy"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text("Terms & Conditions"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text("Security Settings"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),

              ],
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
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
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Logout"),
                    content: const Text(
                      "Are you sure you want to logout?",
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
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          const Center(
            child: Text(
              "ParkEase v1.0.0",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }
}