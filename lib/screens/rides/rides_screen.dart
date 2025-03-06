import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/rides/widgets/ride_pref_bar.dart';

import '../../dummy_data/dummy_data.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';

import 'widgets/rides_tile.dart';

///
///  The Ride Selection screen allows the user to select a ride once ride preferences have been defined.
///  The screen also allows the user to redefine the ride preferences and activate some filters.
///
class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  late RidePreference currentPreference;

  @override
  void initState() {
    super.initState();
    // Fetch the current ride preference from the service when the screen initializes
    currentPreference = RidesService.instance.getCurrentRidePreference();
  }

  // Getter to get the matching rides based on the current preference
  List<Ride> get matchingRides => RidesService.instance.getRidesFor(currentPreference);

  void onBackPressed() {
    Navigator.of(context).pop(); // Back to the previous view
  }

  void onPreferencePressed() async {
    // TODO  6 : we should push the modal with the current pref

    // TODO 9 :  After pop, we should get the new current pref from the modal

    // TODO 10 :  Then we should update the service current pref,   and update the view
  }

  void onFilterPressed() {
    // Handle filter logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
        child: Column(
          children: [
            // Top search RidePrefBar
            RidePrefBar(
              ridePreference: currentPreference,
              onBackPressed: onBackPressed,
              onPreferencePressed: onPreferencePressed,
              onFilterPressed: onFilterPressed,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: matchingRides.length,
                itemBuilder: (ctx, index) => RideTile(
                  ride: matchingRides[index],
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
