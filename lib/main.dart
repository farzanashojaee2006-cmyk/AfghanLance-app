import 'package:afghanlance/Chosing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AfghanLance());
}

class AfghanLance extends StatefulWidget {
   AfghanLance({super.key});

  @override
  State<AfghanLance> createState() => _AfghanLanceState();
}

class _AfghanLanceState extends State<AfghanLance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage());
  }
}

