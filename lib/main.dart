import 'package:afghanlance/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AfghanLance());
}

class AfghanLance extends StatefulWidget {
  const AfghanLance({super.key});

  @override
  State<AfghanLance> createState() => _AfghanLanceState();
}

class _AfghanLanceState extends State<AfghanLance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

