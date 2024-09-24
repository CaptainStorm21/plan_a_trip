import 'package:flutter/material.dart';
import 'PlanATrip/plan_a_trip.dart'; // Import the PlanATrip screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Trip Planner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(), // Set MainScreen as the home screen
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Planner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateToPlanATrip(context); // Call the navigation function
          },
          child: const Text('Build a Trip'),
        ),
      ),
    );
  }

  // Function to navigate to PlanATripScreen
  void _navigateToPlanATrip(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PlanATripScreen()),
    );
  }
}
