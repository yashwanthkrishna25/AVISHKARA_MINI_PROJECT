import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              const SizedBox(height: 20),

              CircleAvatar(
                radius: 45,
                backgroundColor:
                    AppColors.primary.withOpacity(.1),
                child: const Icon(
                  Icons.lock_reset,
                  size: 45,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Enter your email address to receive a password reset link.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Please enter your email"),
                        ),
                      );
                      return;
                    }

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Success"),
                        content: Text(
                          "A password reset link will be sent to:\n\n${emailController.text}",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Send Reset Link",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}