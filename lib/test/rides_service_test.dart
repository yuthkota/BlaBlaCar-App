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
    test('T2: Create a ride preference with a filter for pets allowed', () {
      // Create a ride preference from Battambang to Siem Reap
      RidePreference ridePreference = RidePreference(
        departure: Location(name: 'Battambang', country: Country.cambodia),
        departureDate: DateTime.now(),
        arrival: Location(name: 'Siem Reap', country: Country.cambodia),
        requestedSeats: 1,
        ridesFilter: RidesFilter(acceptPets: true),
      );

      // Set the current preference in the RidesService
      RidesService.instance.setCurrentRidePreference(ridePreference);

      // Get the matching rides for this preference
      List<Ride> matchingRides = RidesService.instance.getRidesFor(ridePreference);

      // Check the expected result
      print("Matching rides with pets allowed:");
      matchingRides.forEach((ride) {
        print('- at ${ride.departureDate.hour}:${ride.departureDate.minute} with ${ride.driver.firstName} '
            '(${ride.availableSeats} seats available) - Pet Allowed: ${ride.ridesFilter.acceptPets}');
      });

      // Filter the pet-allowed rides specifically
      List<Ride> petAllowedRides = matchingRides.where((ride) => ride.ridesFilter.acceptPets).toList();

      // Print pet-allowed rides specifically
      print("Pet Allowed Rides (Filtered):");
      petAllowedRides.forEach((ride) {
        print('- at ${ride.departureDate.hour}:${ride.departureDate.minute} with ${ride.driver.firstName} '
            '(${ride.availableSeats} seats available)');
      });

      // Check that pet-allowed rides exist
      expect(petAllowedRides.length, greaterThan(0), reason: 'No pet-allowed rides found');
      // Check if 'Limhao' is in the filtered list
      expect(petAllowedRides.any((ride) => ride.driver.firstName == 'Limhao'), isTrue, reason: 'Expected to find Limhao in the pet-allowed rides');
      // Check if 'Sovanda' is in the filtered list
      expect(petAllowedRides.any((ride) => ride.driver.firstName == 'Sovanda'), isTrue, reason: 'Expected to find Sovanda in the pet-allowed rides');
    });
  });
}
