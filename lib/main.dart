import 'package:flutter/material.dart';

import 'views/main_navigator_screen.dart';

void main() {
  runApp(const NetflixCloneApp());
}

class NetflixCloneApp extends StatelessWidget {
  const NetflixCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Netflix Clone App",
      home: MainNavigatorScreen(),
    );
  }
}