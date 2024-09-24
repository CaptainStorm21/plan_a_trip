// journey_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class JourneyEvent {}

class SelectTravelTypeEvent extends JourneyEvent {
  final String travelType;

  SelectTravelTypeEvent(this.travelType);
}

class SelectCityOfDepartureEvent extends JourneyEvent {
  final String cityOfDeparture;

  SelectCityOfDepartureEvent(this.cityOfDeparture);
}

class SelectDateEvent extends JourneyEvent {
  final DateTime selectedDate;

  SelectDateEvent(this.selectedDate);
}

// States
abstract class JourneyState {}

class JourneyInitialState extends JourneyState {}

class TravelTypeSelectedState extends JourneyState {
  final String selectedType;

  TravelTypeSelectedState(this.selectedType);
}

class CityOfDepartureSelectedState extends JourneyState {
  final String cityOfDeparture;

  CityOfDepartureSelectedState(this.cityOfDeparture);
}

class DateSelectedState extends JourneyState {
  final DateTime selectedDate;

  DateSelectedState(this.selectedDate);
}

// Bloc
class JourneyBloc extends Bloc<JourneyEvent, JourneyState> {
  JourneyBloc() : super(JourneyInitialState());

  @override
  Stream<JourneyState> mapEventToState(JourneyEvent event) async* {
    if (event is SelectTravelTypeEvent) {
      yield TravelTypeSelectedState(event.travelType);
    } else if (event is SelectCityOfDepartureEvent) {
      yield CityOfDepartureSelectedState(event.cityOfDeparture);
    } else if (event is SelectDateEvent) {
      yield DateSelectedState(event.selectedDate);
    }
  }
}
