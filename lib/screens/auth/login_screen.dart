import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 30),

              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: const Icon(
                    Icons.local_parking,
                    size: 60,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sign in to continue",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: "Email",

                  prefixIcon: const Icon(Icons.email),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,

                decoration: InputDecoration(
                  labelText: "Password",

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [

                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),

                  const Text("Remember Me"),

                  const Spacer(),

                  TextButton(
  onPressed: () {
    Navigator.pushNamed(
      context,
      "/forgot-password",
    );
  },
  child: const Text("Forgot Password?"),
),
                ],
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {
  Navigator.pushReplacementNamed(context, "/main");
},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: const [

                  Expanded(child: Divider()),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR"),
                  ),

                  Expanded(child: Divider()),

                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton.icon(
                  onPressed: () {},

                  icon: const Icon(Icons.g_mobiledata, size: 35),

                  label: const Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: 16),
                  ),

                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Text("Don't have an account?"),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: const Text("Sign Up"),
                  ),

                ],
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}