import 'package:flutter/material.dart';
import 'forget.dart';
import 'register.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  // Button controller
  void gotoregister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }
  void gotohomepage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }
  void forgetpage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Forgetpage()),
    );
  }

  // Input controller
  void warningMsg(){
    AlertDialog eligibilityAlterDialog = AlertDialog(
      title: const Text ('Availability'),
      content: const Text ('Please fill up the full form'),
    );
    showDialog(context: context,
        builder: (BuildContext context){
        return eligibilityAlterDialog;
    }
    );
  }

  // Text field builder
  Widget buildTextField(String label, IconData icon, bool isPassword) {
    return TextFormField(
      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),//Title

              const SizedBox(height: 30),

              // Form container
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
                child: Column(
                  children: [
                    // Username field
                    buildTextField("Username", Icons.person, false),
                    const SizedBox(height: 10),

                    // Password field
                    buildTextField("Password", Icons.lock, true),
                    const SizedBox(height: 20),

                    // Login button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 40),
                      ),
                      onPressed: () => gotohomepage(context),
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),

              // Forget-password text
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => forgetpage(context) ,
                child: const Text(
                  "Forget password?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),

              // Register text
              const SizedBox(height: 20),
              const Text("Not Registered Yet?"),
              TextButton(
                onPressed: () => gotoregister(context),
                child: const Text(
                  "Register Here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
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
