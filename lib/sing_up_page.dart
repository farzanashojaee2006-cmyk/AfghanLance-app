import 'package:afghanlance/Home.dart';
import 'package:afghanlance/login_page.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/Conestant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  Widget buildTextField(BuildContext context, String hint, IconData icon, {bool isPassword = false}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(

        color: isDark ? Colors.grey[900] : kLightColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.grey[600]),
          prefixIcon: Icon(icon, color: kThirdColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }


  Widget socialButton(BuildContext context, String text, IconData icon) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : kLightColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isDark ? Colors.white12 : Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: kThirdColor),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      backgroundColor: isDark ? const Color(0xFF121212) : KFirtsColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "AfghanLance",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kThirdColor,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome! Please fill the form to continue.",
                  style: TextStyle(color: isDark ? Colors.white70 : Colors.grey[700]),
                ),
                const SizedBox(height: 30),
                buildTextField(context, "Full Name", Icons.person_outline),
                const SizedBox(height: 15),
                buildTextField(context, "Email", Icons.email_outlined),
                const SizedBox(height: 15),
                buildTextField(context, "Country", Icons.flag_outlined),
                const SizedBox(height: 15),
                buildTextField(context, "Password", Icons.lock_outline, isPassword: true),
                const SizedBox(height: 15),
                buildTextField(context, "Confirm Password", Icons.lock_outline, isPassword: true),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kThirdColor,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Divider(color: isDark ? Colors.white24 : Colors.black26)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Or", style: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                    ),
                    Expanded(child: Divider(color: isDark ? Colors.white24 : Colors.black26)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: socialButton(context, "Google", Icons.g_mobiledata)),
                    const SizedBox(width: 10),
                    Expanded(child: socialButton(context, "Phone", Icons.phone)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: TextStyle(color: isDark ? Colors.white70 : Colors.black)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: kThirdColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
