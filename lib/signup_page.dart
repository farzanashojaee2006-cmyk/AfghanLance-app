import 'package:afghanlance/constants.dart';
import 'package:afghanlance/Home.dart';
import 'package:afghanlance/login_page.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

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

  // COUNTRY PICKER
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
// Reusable TextField

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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:  BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding:EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 10,
        ),
      ),
    );
  }
  // Social Button

  Widget socialButton(String text, IconData icon) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : kLightColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: kThirdColor),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }

  // Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ?  Color(0xFF121212) : kFirstColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "AFGHANLANCE",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kThirdColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Welcome! Please fill the form to continue.",
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 30),
                  //Name Row
                  Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          hint: "First Name",
                          icon: Icons.person_outline,
                          controller: firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildTextField(
                          hint: "Last Name",
                          icon: Icons.person_outline,
                          controller: lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  // Email
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

                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter phone number";
                        }
                        return null;
                      },
                    ),
                  SizedBox(height: 15),

                  // Public Username
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

                  SizedBox(height: 15),
                  //  Country
                  GestureDetector(
                    onTap: openCountryPicker,
                    child: Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 17,
                      ),
                      decoration: BoxDecoration(
                        color: kLightColor,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.public, color: kThirdColor),

                          SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              selectedCountry,
                              style: TextStyle(
                                color: selectedCountry == "Select Country"
                                    ? Color(0xFF666666)
                                    : Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: kFirstColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  //Password
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
                      if (v == null || v.isEmpty) {
                        return "Password is required";
                      }

                      if (v.length < 8) {
                        return "Minimum 8 characters";
                      }

                      if (!RegExp(r'[A-Z]').hasMatch(v)) {
                        return "Add uppercase letter";
                      }

                      if (!RegExp(r'[0-9]').hasMatch(v)) {
                        return "Add number";
                      }

                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>-]').hasMatch(v)) {
                        return "Add special character";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  // PASSWORD STRENGTH
                  if (passwordController.text.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          value: passwordController.text.length >= 10
                              ? 1
                              : passwordController.text.length / 10,
                          backgroundColor: Colors.grey.shade300,
                          color: passwordController.text.length >= 8
                              ? Colors.green
                              : Colors.orange,
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        SizedBox(height: 6),

                        Text(
                          passwordController.text.length >= 8
                              ? "Strong Password"
                              : "Weak Password",
                          style: TextStyle(
                            color: passwordController.text.length >= 8
                                ? Colors.green
                                : Colors.orange,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                  // CONFIRM PASSWORD
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
                      if (v == null || v.isEmpty) {
                        return "Confirm your password";
                      }

                      if (v != passwordController.text) {
                        return "Passwords do not match";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 25),
                  // Sign Up Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kThirdColor,
                      minimumSize:Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomePage(isClient: false),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: isDark ? Colors.white24 : Colors.black26,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or",
                          style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: isDark ? Colors.white24 : Colors.black26,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Center(
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata, color: kThirdColor),
                          SizedBox(width: 8),
                          Text(
                            "Continue with Google",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: kThirdColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    countryController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
