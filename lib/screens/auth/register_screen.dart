import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Create Account"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.primary.withOpacity(.1),
                child: const Icon(
                  Icons.person_add,
                  size: 50,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Join ParkEase",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Create your account to continue",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              buildField(
                controller: nameController,
                label: "Full Name",
                icon: Icons.person,
              ),

              const SizedBox(height: 18),

              buildField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
              ),

              const SizedBox(height: 18),

              buildField(
                controller: phoneController,
                label: "Phone Number",
                icon: Icons.phone,
              ),

              const SizedBox(height: 18),

              buildPasswordField(
                controller: passwordController,
                label: "Password",
                obscure: obscurePassword,
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),

              const SizedBox(height: 18),

              buildPasswordField(
                controller: confirmPasswordController,
                label: "Confirm Password",
                obscure: obscureConfirmPassword,
                onTap: () {
                  setState(() {
                    obscureConfirmPassword =
                        !obscureConfirmPassword;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [

                  const Text("Already have an account?"),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Login"),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscure,
    required VoidCallback onTap,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        labelText: label,
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: Icon(
            obscure
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(15),
        ),
      ),
    );
  }
}