import 'package:flutter/material.dart';

import 'SupportPage.dart';
import 'helpePage.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HelpPage(),
          SupportPage(),
        ],
      ),
    );
  }
}