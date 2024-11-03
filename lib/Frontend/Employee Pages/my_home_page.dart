import 'package:flutter/material.dart';
import 'package:geo_pulse/Frontend/Components/my_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const MyBottomNav();
  }
}