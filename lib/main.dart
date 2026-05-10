import 'package:flutter/material.dart';

import 'Chosing_page.dart';
import 'Conestant.dart';

void main() {
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
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: KFirtsColor,
        primaryColor: kThirdColor,
        colorScheme: const ColorScheme.light(primary: kThirdColor),
      ),


      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: kThirdColor,
        colorScheme: const ColorScheme.dark(
          primary: kThirdColor,
          surface: Color(0xFF1E1E1E),
        ),
      ),

      home: WelcomePage(onToggleTheme: toggleTheme),
    );
  }
}
