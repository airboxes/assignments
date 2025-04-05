import 'package:flutter/material.dart';
import 'package:login/main.dart';

class Forgetpage extends StatefulWidget {
  const Forgetpage({super.key});

  @override
  _ForgetpageState createState() => _ForgetpageState();
}

class _ForgetpageState extends State<Forgetpage> {
  bool _isPasswordVisible = false;

  // Define a GlobalKey for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Button controller
  void gotologin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Page Header
                const Text(
                  "Forget Password",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Form Container
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Username Field
                        buildTextField("Username", Icons.person, true),
                        const SizedBox(height: 10),

                        // Password Field
                        buildTextField("Password", Icons.lock, true),
                        const SizedBox(height: 10),

                        // Confirm Password Field
                        buildTextField("Confirm password", Icons.lock, true),
                        const SizedBox(height: 20),

                        // Change Password Button with Validation Check
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 40),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              gotologin(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Your password has been successfully changed."),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            }
                          },
                          child: const Text("Change password"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom Text Field Widget with validation
  Widget buildTextField(String label, IconData icon, bool isPassword) {
    return TextFormField(
      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      // Validator to check if the field is empty
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
