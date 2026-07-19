
import 'package:afghanlance/routs/routs.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_theme.dart';
import 'widgets/auth_gate.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AfghanLance());
}

class AfghanLance extends StatefulWidget {
  const AfghanLance({super.key});

  @override
  State<AfghanLance> createState() => _AfghanLanceState();
}

class _AfghanLanceState extends State<AfghanLance> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: _themeMode,


      theme: AppTheme.lightTheme,


      darkTheme: AppTheme.darkTheme,


      routes: AppRoutes.routes(toggleTheme),


      initialRoute: AuthGate.id,
    );
  }
}
