import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
      TextEditingController(text: "Yashwanth Krishna");

  final TextEditingController emailController =
      TextEditingController(text: "yashwanth@email.com");

  final TextEditingController phoneController =
      TextEditingController(text: "+91 9876543210");

  final TextEditingController addressController =
      TextEditingController(text: "Warangal, Telangana");

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Widget buildField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "$label is required";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              const SizedBox(height: 10),

              Stack(
                alignment: Alignment.bottomRight,
                children: [

                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),

                  FloatingActionButton.small(
                    heroTag: "camera",
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Image Picker will be added later",
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.camera_alt),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              buildField(
                label: "Full Name",
                icon: Icons.person,
                controller: nameController,
              ),

              buildField(
                label: "Email",
                icon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              buildField(
                label: "Phone",
                icon: Icons.phone,
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),

              buildField(
                label: "Address",
                icon: Icons.location_on,
                controller: addressController,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Profile Updated Successfully",
                          ),
                        ),
                      );

                      Future.delayed(
                        const Duration(milliseconds: 800),
                        () {
                          Navigator.pop(context);
                        },
                      );
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