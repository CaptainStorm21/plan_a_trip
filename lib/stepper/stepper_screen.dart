import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'stepper_bloc.dart';
import '../craftyourjourney/ui/journey_form.dart'; // Import the journey form

class StepperScreen extends StatelessWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepperBloc(),
      child: const Scaffold(
        body: StepperBody(),
      ),
    );
  }
}

class StepperBody extends StatelessWidget {
  const StepperBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperBloc, StepperState>(
      builder: (context, state) {
        return Column(
          children: [
            // Render Stepper UI
            Expanded(
              child: Stepper(
                type: StepperType.horizontal, // Set stepper type to horizontal
                currentStep: state.currentStep,
                onStepTapped: (step) {
                  BlocProvider.of<StepperBloc>(context).add(SetStep(step));
                },
                onStepContinue: () {
                  BlocProvider.of<StepperBloc>(context).add(GoToNextStep());
                },
                onStepCancel: () {
                  if (state.currentStep > 0) {
                    BlocProvider.of<StepperBloc>(context).add(GoToPreviousStep());
                  }
                },
                steps: _buildSteps(context, state.currentStep),
                controlsBuilder: (BuildContext context, ControlsDetails details) {
                  return Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: const Text('Continue'),
                      ),
                      const SizedBox(width: 8),
                      if (state.currentStep > 0)
                        ElevatedButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  List<Step> _buildSteps(BuildContext context, int currentStep) {
    return [
      Step(
        title: _buildStepTitle('Destination'),
        content: const SizedBox(
          width: double.infinity,
          child: JourneyForm(), // Embed the Journey Form in the first step
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ? StepState.editing : StepState.indexed,
      ),
      Step(
        title: _buildStepTitle('Places to Explore'),
        content: const SizedBox(
          width: double.infinity,
          child: Text('Travel Preferences Form'), // Replace with actual form
        ),
        isActive: currentStep >= 1,
        state: currentStep == 1 ? StepState.editing : StepState.indexed,
      ),
      Step(
        title: _buildStepTitle('Accommodations'),
        content: const SizedBox(
          width: double.infinity,
          child: Text('Accommodations Form'), // Replace with actual form
        ),
        isActive: currentStep >= 2,
        state: currentStep == 2 ? StepState.editing : StepState.indexed,
      ),
      Step(
        title: _buildStepTitle('Budget'),
        content: const SizedBox(
          width: double.infinity,
          child: Text('Budget Form'), // Replace with actual form
        ),
        isActive: currentStep >= 3,
        state: currentStep == 3 ? StepState.editing : StepState.indexed,
      ),
      Step(
        title: _buildStepTitle('Review and Confirm'),
        content: const SizedBox(
          width: double.infinity,
          child: Text('Review and Confirm Information'), // Replace with actual review widget
        ),
        isActive: currentStep >= 4,
        state: currentStep == 4 ? StepState.editing : StepState.indexed,
      ),
      Step(
        title: _buildStepTitle('Step 6: Finish'),
        content: const SizedBox(
          width: double.infinity,
          child: Text('Finish the Journey!'), // Final confirmation or summary
        ),
        isActive: currentStep >= 5,
        state: currentStep == 5 ? StepState.complete : StepState.indexed,
      ),
    ];
  }

  Widget _buildStepTitle(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle), // Replace with an appropriate icon for each step
        const SizedBox(height: 4), // Space between icon and title
        Text(title),
      ],
    );
  }
}
