import 'package:flutter/material.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();

  final ownerController = TextEditingController();
  final numberController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final colorController = TextEditingController();

  String vehicleType = "Car";
  bool isDefault = false;

  @override
  void dispose() {
    ownerController.dispose();
    numberController.dispose();
    brandController.dispose();
    modelController.dispose();
    colorController.dispose();
    super.dispose();
  }

  Widget buildField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Vehicle"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              buildField(
                "Owner Name",
                ownerController,
                Icons.person,
              ),

              buildField(
                "Vehicle Number",
                numberController,
                Icons.confirmation_number,
              ),

              buildField(
                "Brand",
                brandController,
                Icons.directions_car,
              ),

              buildField(
                "Model",
                modelController,
                Icons.car_rental,
              ),

              buildField(
                "Color",
                colorController,
                Icons.color_lens,
              ),

              DropdownButtonFormField<String>(
                value: vehicleType,
                decoration: InputDecoration(
                  labelText: "Vehicle Type",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Car",
                    child: Text("Car"),
                  ),
                  DropdownMenuItem(
                    value: "Bike",
                    child: Text("Bike"),
                  ),
                  DropdownMenuItem(
                    value: "EV",
                    child: Text("Electric Vehicle"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    vehicleType = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              SwitchListTile(
                value: isDefault,
                title: const Text("Set as Default Vehicle"),
                onChanged: (value) {
                  setState(() {
                    isDefault = value;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: const Text(
                    "Save Vehicle",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Vehicle Saved Successfully"),
                        ),
                      );

                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}