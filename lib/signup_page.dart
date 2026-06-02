import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';
import 'package:afghanlance/Home.dart';
import 'package:afghanlance/login_page.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum SignupMethod { email, phone }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignupMethod signupMethod = SignupMethod.email;
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();

  String selectedCountry = "Select Country";

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  void openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country.name;
        });
      },
    );
  }

  Widget buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? togglePassword,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? Colors.grey[900] : kLightColor,
        hintText: hint,
        hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.grey[600]),
        prefixIcon: Icon(icon, color: kThirdColor),
        suffixIcon: isPassword
            ? IconButton(
          onPressed: togglePassword,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
        )
            : null,
        errorStyle: const TextStyle(fontSize: 12, height: 1.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(height: 30),
                    Text("AFGHANLANCE",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kThirdColor)),
                    const SizedBox(height: 30),
                    Text("Create Account",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black)),
                    const SizedBox(height: 8),
                    Text("Welcome! Please fill the form to continue.",
                        style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.grey[700])),
                    const SizedBox(height: 30),

                    // First & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            hint: "First Name",
                            icon: Icons.person_outline,
                            controller: firstNameController,
                            validator: (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: buildTextField(
                            hint: "Last Name",
                            icon: Icons.person_outline,
                            controller: lastNameController,
                            validator: (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Email or Phone
                    if (signupMethod == SignupMethod.email)
                buildTextField(
                hint: "Email",
                icon: Icons.email_outlined,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your email";
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return "Enter valid email";
                  }
                  return null;
                },
              )
              else
              buildTextField(
              hint: "Phone Number",
              icon: Icons.phone,
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) =>
              value == null || value.isEmpty ? "Enter phone number" : null,
            ),
            const SizedBox(height: 15),

            // Username
            buildTextField(
              hint: "Public Username",
              icon: Icons.alternate_email,
              controller: usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter username";
                }
                if (value.length < 5) {
                  return "Minimum 5 characters";
                }
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Country Picker
            GestureDetector(
              onTap: openCountryPicker,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 17),
                decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Icon(Icons.public, color: kThirdColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        selectedCountry,
                        style: TextStyle(
                          color: selectedCountry == "Select Country"
                              ? const Color(0xFF666666)
                              : Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        color: kFirstColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Password
            buildTextField(
              hint: "Password",
              icon: Icons.lock_outline,
              controller: passwordController,
              isPassword: true,
              obscureText: obscurePassword,
              togglePassword: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              validator: (v) {
                if (v == null || v.isEmpty) return "Password is required";
                if (v.length < 8) return "Minimum 8 characters";
                if (!RegExp(r'[A-Z]').hasMatch(v)) return "Add uppercase letter";
                if (!RegExp(r'[0-9]').hasMatch(v)) return "Add number";
                if (!RegExp(r'[!@#$%^&*(),.?\":{}|<>-]').hasMatch(v)) {
                  return "Add special character";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // Confirm Password
            buildTextField(
              hint: "Confirm Password",
              icon: Icons.lock_outline,
              controller: confirmPasswordController,
              isPassword: true,
              obscureText: obscureConfirmPassword,
              togglePassword: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              validator: (v) {
                if (v == null || v.isEmpty) return "Confirm your password";
                if (v != passwordController.text) return "Passwords do not match";
                return null;
              },
            ),
            const SizedBox(height: 25),

            // Sign Up Button with Firebase
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kThirdColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  try {
                    // Create user in Firebase Authentication
                    final credential = await FirebaseAuth