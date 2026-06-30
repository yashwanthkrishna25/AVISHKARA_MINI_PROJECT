import 'package:flutter/material.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> vehicles = [
    {
      "brand": "Hyundai",
      "model": "Creta",
      "number": "TS09AB1234",
      "color": "White",
      "type": "Car",
      "icon": Icons.directions_car,
    },
    {
      "brand": "Honda",
      "model": "Activa 6G",
      "number": "TS10XY5678",
      "color": "Black",
      "type": "Bike",
      "icon": Icons.two_wheeler,
    },
    {
      "brand": "Tata",
      "model": "Nexon",
      "number": "TS07CD9012",
      "color": "Blue",
      "type": "SUV",
      "icon": Icons.airport_shuttle,
    },
  ];

  List<Map<String, dynamic>> filteredVehicles = [];

  @override
  void initState() {
    super.initState();
    filteredVehicles = vehicles;
  }

  void searchVehicle(String value) {
    setState(() {
      filteredVehicles = vehicles.where((vehicle) {
        return vehicle["brand"]
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            vehicle["number"]
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            vehicle["model"]
                .toLowerCase()
                .contains(value.toLowerCase());
      }).toList();
    });
  }

  void deleteVehicle(int index) {
    setState(() {
      vehicles.remove(filteredVehicles[index]);
      filteredVehicles = vehicles;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Vehicle Deleted"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("My Vehicles"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, "/add-vehicle");
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Vehicle"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: searchController,
              onChanged: searchVehicle,
              decoration: InputDecoration(
                hintText: "Search vehicle...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: filteredVehicles.isEmpty
                  ? const Center(
                      child: Text(
                        "No Vehicles Found",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredVehicles.length,
                      itemBuilder: (context, index) {
                        final vehicle = filteredVehicles[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [

                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Colors.blue.shade100,
                                  child: Icon(
                                    vehicle["icon"],
                                    color: Colors.blue,
                                    size: 34,
                                  ),
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        vehicle["brand"],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 5),

                                      Text(vehicle["model"]),

                                      Text(vehicle["number"]),

                                      Text(
                                        "${vehicle["color"]} • ${vehicle["type"]}",
                                      ),
                                    ],
                                  ),
                                ),

                                Column(
                                  children: [

                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          "/edit-vehicle",
                                        );
                                      },
                                    ),

                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        deleteVehicle(index);
                                      },
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

          ],
        ),
      ),
    );
  }
}