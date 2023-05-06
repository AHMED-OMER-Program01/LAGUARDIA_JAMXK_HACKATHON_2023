import 'package:flutter/material.dart';
import 'package:jamxk/%20common/assets.dart';
import 'package:jamxk/%20common/magic_numbers.dart';
import 'package:jamxk/Menu/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [purple, deepBlue],
            transform: GradientRotation(gradientRotation),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const AppBottonBar(),
    );
  }
}
