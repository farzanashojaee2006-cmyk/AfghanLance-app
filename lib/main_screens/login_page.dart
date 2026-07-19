import 'package:afghanlance/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';
import 'package:afghanlance/main_screens/Home.dart';
import 'package:afghanlance/main_screens/signup_page.dart';

import '../sub_screen/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id="/LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  Widget buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? togglePassword,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? Colors.grey[900] : kLightColor,
        hintText: hint,
        hintStyle: TextStyle(
          color: isDark ? Colors.white54 : Colors.grey[600],
        ),
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
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding:  EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18,
        ),
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
            padding:  EdgeInsets.symmetric(horizontal: 20),
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
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),

                  Text(
                    "Login to continue",
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 30),

                  // EMAIL
                  buildTextField(
                    hint: "Username or Email",
                    icon: Icons.person_outline,
                    controller: emailController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),

                  // PASSWORD
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
                        return "Enter password";
                      }
                      return null;
                    },
                  ), SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // LOGIN BUTTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kThirdColor,
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;

                      try {
                        String loginInput = emailController.text.trim();
                        String emailForLogin = loginInput;


                        if (!loginInput.contains('@')) {
                          final query = await FirebaseFirestore.instance
                              .collection('users')
                              .where('username', isEqualTo: loginInput)
                              .limit(1)
                              .get();

                          if (query.docs.isEmpty) {
                            throw FirebaseAuthException(
                              code: 'user-not-found',
                              message: 'No user found with this username.',
                            );
                          }

                          emailForLogin = query.docs.first.data()['email'];
                        }

                        final userCredential = await _authService.login(
                          email: emailForLogin,
                          password: passwordController.text.trim(),
                        );

                        final uid = userCredential.user!.uid;

                        final doc = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .get();

                        final data = doc.data();

                        if (data == null) {
                          throw Exception("User data not found");
                        }

                        final isClient = data['role'] == 'client';

                        if (!mounted) return;

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomePage(
                              isClient: isClient,
                            ),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        String message = "Login failed";

                        if (e.code == 'user-not-found') {
                          message = "No user found with this email/username";
                        } else if (e.code == 'wrong-password') {
                          message = "Wrong password";
                        } else if (e.code == 'invalid-credential') {
                          message = "Email/Username or password is incorrect";
                        } else if (e.message != null) {
                          message = e.message!;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message)),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    },
                    child:Text(
                      "Login",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),

                  SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: isDark ? Colors.white24 : Colors.black26,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or"),
                      ),
                      Expanded(
                        child: Divider(
                          color: isDark ? Colors.white24 : Colors.black26,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // SOCIAL
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          final userCredential =
                          await _authService.signInWithGoogle();

                          if (userCredential == null) return;

                          final user = userCredential.user;
                          if (user == null) return;

                          final doc = await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .get();

                          if (!doc.exists) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "No account found. Please sign up first.",
                                ),
                              ),
                            );

                            await FirebaseAuth.instance.signOut();
                            return;
                          }

                          final data = doc.data()!;

                          final isClient = data['role'] == 'client';

                          if (!mounted) return;

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomePage(
                                isClient: isClient,
                              ),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                  ),                  SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>  SignUpScreen(isClient: true,),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: kThirdColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), SizedBox(height: 20),
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}