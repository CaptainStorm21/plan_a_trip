// lib/craftyourjourney/ui/journey_form.dart

import 'journey_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// For date formatting

class JourneyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JourneyBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Craft Your Journey'),
        ),
        body: JourneyFormBody(),
      ),
    );
  }
}

class JourneyFormBody extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _JourneyFormBodyState createState() => _JourneyFormBodyState();
}

class _JourneyFormBodyState extends State<JourneyFormBody> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Travel Type Selection
          BlocBuilder<JourneyBloc, JourneyState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text(
                    'Who will be joining you on this trip?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10.0,
                    children: [
                      travelOptionButton(context, 'Solo Travel', state),
                      travelOptionButton(context, 'Exploring Together', state),
                      travelOptionButton(context, 'Discovering new places with friends', state),
                      travelOptionButton(context, 'Journeying with family', state),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),

          // City of Departure Dropdown
          const Text('City of Departure'),
          DropdownButton<String>(
            items: ['Airport', 'Train Station', 'Car', 'Seaport']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              BlocProvider.of<JourneyBloc>(context).add(SelectCityOfDepartureEvent(value!));
            },
          ),
          const SizedBox(height: 20),

          // Calendar Date Picker
          const Text('Date of Departure'),
          const SizedBox(height: 10),
          BlocBuilder<JourneyBloc, JourneyState>(
            builder: (context, state) {
              return CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: today,
                lastDate: DateTime(2101),
                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                  BlocProvider.of<JourneyBloc>(context).add(SelectDateEvent(date));
                },
              );
            },
          ),
          const SizedBox(height: 20),
          
          ElevatedButton(
            onPressed: () {
              // Handle form submission logic
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }

  // Travel Option Button
  Widget travelOptionButton(BuildContext context, String option, JourneyState state) {
    bool isSelected = false;
    if (state is TravelTypeSelectedState) {
      isSelected = state.selectedType == option;
    }
    
    return GestureDetector(
      onTap: () {
        BlocProvider.of<JourneyBloc>(context).add(SelectTravelTypeEvent(option));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Text(option),
      ),
    );
  }
}
