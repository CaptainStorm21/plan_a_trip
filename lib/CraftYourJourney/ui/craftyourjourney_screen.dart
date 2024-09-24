import 'package:flutter/material.dart';
import 'package:plan_a_trip/stepper/stepper_screen.dart';

class CraftYourJourneyScreen extends StatelessWidget {
  const CraftYourJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Craft Your Journey'),
      ),
      // Nest the JourneyForm inside the screen body
      body: const StepperScreen() // Place the JourneyForm here
    );
  }
}