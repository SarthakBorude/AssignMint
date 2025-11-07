import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AssignmentManagerApp());
}

class AssignmentManagerApp extends StatelessWidget {
  const AssignmentManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

