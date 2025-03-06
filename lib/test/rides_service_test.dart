import 'package:test/test.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import '../model/ride/ride.dart';
import '../repository/mock/mock_rides_repository.dart';

void main() {
  // Initialize the RidesService with the MockRidesRepository
  final repository = MockRidesRepository();
  RidesService.initialize(repository);

  group('RidesService Tests', () {
    test('T1: Create a ride preference and display matching rides', () {
      // Create a ride preference from Battambang to Siem Reap
      RidePreference ridePreference = RidePreference(
        departure: Location(
            name: 'Battambang', country: Country.cambodia),
        departureDate: DateTime.now(),
        arrival: Location(
            name: 'Siem Reap', country: Country.cambodia),
        requestedSeats: 1,
        ridesFilter: RidesFilter(acceptPets: false),
      );

      // Set the current preference in the RidesService
      RidesService.instance.setCurrentRidePreference(ridePreference);

      // Get the matching rides for this preference
      List<Ride> matchingRides =
          RidesService.instance.getRidesFor(ridePreference);

      // Check the expected result
      expect(matchingRides.length, 5,
          reason: 'Expected 5 results to be displayed');

      // Additional check for ride availability and status
      Ride fullRide =
          matchingRides.firstWhere((ride) => ride.availableSeats == 0);
      expect(fullRide.driver.firstName, 'Chaylim',
          reason: 'Expected the full ride to be from Chaylim');
    });

    test('T2: Create a ride preference with a filter for pets allowed', () {
  //Create a ride preference from Battambang to Siem Reap
  RidePreference ridePreference = RidePreference(
    departure: Location(name: 'Battambang', country: Country.cambodia),
    departureDate: DateTime.now(),
    arrival: Location(name: 'Siem Reap', country: Country.cambodia),
    requestedSeats: 1,
    ridesFilter: RidesFilter(acceptPets: false),
  );

  //Set the current preference in the RidesService with the initial filter
  RidesService.instance.setCurrentRidePreference(ridePreference);

  //Apply a filter for pet-allowed rides (acceptPets: true)
  ridePreference = RidePreference(
    departure: Location(name: 'Battambang', country: Country.cambodia),
    departureDate: DateTime.now(),
    arrival: Location(name: 'Siem Reap', country: Country.cambodia),
    requestedSeats: 1,
    ridesFilter: RidesFilter(acceptPets: true),
  );

  //Set the updated preference in the RidesService with the pet filter
  RidesService.instance.setCurrentRidePreference(ridePreference);

  //Get the matching rides for this preference with the pet filter
  List<Ride> matchingRidesWithPets = RidesService.instance.getRidesFor(ridePreference);

  // Print out all matching rides for debugging
  for (var ride in matchingRidesWithPets) {
    print('Ride driver: ${ride.driver.firstName}, Accepts Pets: ${ride.ridesFilter.acceptPets}');
  }

  //Check the expected result for pet-allowed rides
  List<Ride> petAllowedRides = matchingRidesWithPets.where((ride) => ride.ridesFilter.acceptPets).toList();
  expect(petAllowedRides.length, 5, reason: 'Expected 5 pet-allowed rides to be displayed');

  // Ensure Mengtech is one of the drivers in the filtered rides
  bool hasMengtech = petAllowedRides.any((ride) => ride.driver.firstName == 'Mengtech');
  expect(hasMengtech, true, reason: 'Expected the pet-allowed ride to be from Mengtech');
});

  });
}
