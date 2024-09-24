// lib/stepper/stepper_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Define Stepper Events
abstract class StepperEvent extends Equatable {
  const StepperEvent();

  @override
  List<Object> get props => [];
}

class GoToNextStep extends StepperEvent {}
class GoToPreviousStep extends StepperEvent {}
class SetStep extends StepperEvent {
  final int stepIndex;
  const SetStep(this.stepIndex);

  @override
  List<Object> get props => [stepIndex];
}

// Define Stepper States
class StepperState extends Equatable {
  final int currentStep;

  const StepperState(this.currentStep);

  @override
  List<Object> get props => [currentStep];
}

// Define Bloc to handle stepper events and states
class StepperBloc extends Bloc<StepperEvent, StepperState> {
  StepperBloc() : super(const StepperState(0)); // Initial step set to 0

  @override
  Stream<StepperState> mapEventToState(StepperEvent event) async* {
    if (event is GoToNextStep && state.currentStep < 5) {
      yield StepperState(state.currentStep + 1);
    } else if (event is GoToPreviousStep && state.currentStep > 0) {
      yield StepperState(state.currentStep - 1);
    } else if (event is SetStep) {
      yield StepperState(event.stepIndex);
    }
  }
}
