import 'package:afghanlance/constants.dart';
import 'package:afghanlance/main_screens/login_page.dart';
import 'package:afghanlance/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../onboarding/client/client_onboarding_page.dart';
import '../onboarding/freelancer/freelancer_onboarding_page.dart';

enum SignupMethod { email, phone }

class SignUpScreen extends StatefulWidget {
  static const String id = "/SignUpScreen";
  final bool? isClient;

  const SignUpScreen({super.key, this.isClient});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignupMethod signupMethod = SignupMethod.email;
  final AuthService _authService = AuthService();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  final countryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String selectedCountry = "Select Country";

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {});
    });
  }

  void openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country.name;
          countryController.text = country.name;
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
      autovalidateMode: AutovalidateMode.disabled,
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      decoration: kAuthInputDecoration(
        label: hint,
        icon: icon,
        isDark: isDark,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: togglePassword,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF121212) : kFirstColor,
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

                  SizedBox(height: 35),

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
                      SizedBox(width: 10),
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

                  buildTextField(
                    hint: "Public Username",
                    icon: Icons.alternate_email,
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter username";
                      }

                      final username = value.trim().toLowerCase();

                      if (username.length < 5) return "Minimum 5 characters";
                      if (username.length > 20) return "Maximum 20 characters";

                      if (!RegExp(r'^[a-z][a-z0-9._]*$').hasMatch(username)) {
                        return "Use lowercase letters, numbers, . or _";
                      }

                      if (username.endsWith('.') || username.endsWith('_')) {
                        return "Username cannot end with . or _";
                      }

                      if (username.contains('..') || username.contains('__')) {
                        return "Invalid username format";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 15),

                  TextFormField(
                    readOnly: true,
                    controller: countryController,
                    autovalidateMode: AutovalidateMode.disabled,
                    validator: (value) {
                      if (selectedCountry == "Select Country") {
                        return "Select your country";
                      }
                      return null;
                    },
                    onTap: openCountryPicker,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    decoration: kAuthInputDecoration(
                      label: "Country",
                      icon: Icons.public,
                      isDark: isDark,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: isDark ? Colors.white70 : Colors.grey,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

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

                  SizedBox(height: 8),

                  Text(
                    "Password must contain at least 8 characters, one uppercase letter, one number and one special character.",
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: isDark ? Colors.white54 : Colors.black54,
                    ),
                  ),

                  SizedBox(height: 15),

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

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kThirdColor,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      try {
                        final username = usernameController.text
                            .trim()
                            .toLowerCase();

                        final usernameQuery = await FirebaseFirestore.instance
                            .collection('users')
                            .where('username', isEqualTo: username)
                            .limit(1)
                            .get();

                        if (usernameQuery.docs.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("This username is already taken."),
                            ),
                          );
                          return;
                        }

                        final userCredential = await _authService.signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );

                        final user = userCredential.user;

                        if (user == null) {
                          throw FirebaseAuthException(code: "user-not-created");
                        }

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .set({
                              'uid': user.uid,
                              'firstName': firstNameController.text.trim(),
                              'lastName': lastNameController.text.trim(),
                              'email': emailController.text.trim(),
                              'username': username,
                              'country': countryController.text.trim(),
                              'role': widget.isClient! ? 'client' : 'freelancer',
                              'profileImage': 'assets/images/profile.png',
                              'isVerified': false,
                              'isProfileCompleted': false,
                              'createdAt': FieldValue.serverTimestamp(),
                            });

                        if (!mounted) return;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => widget.isClient!
                                ? ClientOnboardingPage()
                                : FreelancerOnboardingPage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        String message = "Registration failed";

                        if (e.code == 'email-already-in-use') {
                          message = "This email is already registered.";
                        } else if (e.code == 'invalid-email') {
                          message = "Invalid email address.";
                        } else if (e.code == 'weak-password') {
                          message = "Password is too weak.";
                        }

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
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
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          setState(() {
                            isLoading = true;
                          });

                          final userCredential = await _authService
                              .signInWithGoogle();

                          if (userCredential == null) {
                            setState(() {
                              isLoading = false;
                            });
                            return;
                          }

                          final user = userCredential.user;

                          if (user == null) {
                            setState(() {
                              isLoading = false;
                            });
                            return;
                          }

                          final userDoc = FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid);

                          final docSnapshot = await userDoc.get();

                          String username = user.email?.split('@')[0] ?? '';

                          final usernameQuery = await FirebaseFirestore.instance
                              .collection('users')
                              .where('username', isEqualTo: username)
                              .get();

                          if (usernameQuery.docs.isNotEmpty) {
                            username =
                                "${username}_${user.uid.substring(0, 4)}";
                          }

                          if (!docSnapshot.exists) {
                            await userDoc.set({
                              'uid': user.uid,
                              'firstName': user.displayName ?? '',
                              'lastName': '',
                              'email': user.email ?? '',
                              'username': username,
                              'country': '',
                              'role': widget.isClient! ? 'client' : 'freelancer',
                              'profileImage': user.photoURL ?? '',
                              'isVerified': false,
                              'isProfileCompleted': false,
                              'createdAt': FieldValue.serverTimestamp(),
                            });
                          }

                          if (!mounted) return;

                          setState(() {
                            isLoading = false;
                          });

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => widget.isClient!
                                  ? ClientOnboardingPage()
                                  : FreelancerOnboardingPage(),
                            ),
                          );
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                      },
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.g_mobiledata,
                                      color: kThirdColor,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "Continue with Google",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                        ),
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
