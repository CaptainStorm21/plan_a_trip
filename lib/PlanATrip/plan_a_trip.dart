import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/plan_a_trip_bloc.dart';
import '../Wishlist/wishlist.dart';
import '../CraftYourJourney/ui/craftyourjourney_screen.dart';
import '../TrendingDestinations/trending_destinations.dart';
import '../DestinationFinder/destination_finder.dart';

class PlanATripScreen extends StatelessWidget {
  const PlanATripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanATripBloc(),
      child: Scaffold(
        body: Column(
          children: [
            // 10% height for the header with arrow and title
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Implement back action
                      },
                    ),
                    const Text(
                      'Trips',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // 50% height for the background image
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/prague.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 25% height for the row of icons
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconLabel(
                      context,
                      icon: Icons.favorite,
                      label: 'Wishlist',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistScreen()));
                      },
                    ),
                    _buildIconLabel(
                      context,
                      icon: Icons.map,
                      label: 'Craft Your Journey',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CraftYourJourneyScreen()));
                      },
                    ),
                    _buildIconLabel(
                      context,
                      icon: Icons.trending_up,
                      label: 'Trending',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TrendingDestinationsScreen()));
                      },
                    ),
                    _buildIconLabel(
                      context,
                      icon: Icons.directions_car,
                      label: 'Quick Escapes',
                      onTap: () {
                        // Quick escapes action
                      },
                    ),
                    _buildIconLabel(
                      context,
                      icon: Icons.search,
                      label: 'Finder',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DestinationFinderScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for building icons with labels
  Widget _buildIconLabel(BuildContext context, {required IconData icon, required String label, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
