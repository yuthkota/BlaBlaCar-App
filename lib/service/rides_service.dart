import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import '../model/ride/ride.dart';
import '../repository/rides_repository.dart';

/// 
/// This service handles:
/// - Fetching rides based on passenger preferences.
/// - Managing the current ride preference.
class RidesService {
  static RidesService? _instance; // Singleton instance
  final RidesRepository repository;

  // Private constructor
  RidesService._internal(this.repository);

  // Singleton initializer
  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("RidesService is already initialized.");
    }
  }

  // Getter for the singleton instance
  static RidesService get instance {
    if (_instance == null) {
      throw Exception("RidesService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  // Holds the current ride preference
  RidePreference? _currentPreference;

  // Method to get the current ride preference (if exists)
  RidePreference getCurrentRidePreference() {
    if (_currentPreference == null) {
      throw Exception("No current ride preference set.");
    }
    return _currentPreference!;
  }

  // Method to set a new ride preference
  void setCurrentRidePreference(RidePreference newPreference) {
    _currentPreference = newPreference;
  }

  ///
  /// Returns the relevant rides based on passenger preferences.
  ///
  List<Ride> getRidesFor(RidePreference preferences) {
    return repository.getRides(preferences, preferences.ridesFilter);
  }
}

///
/// Filter options for rides
///
class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}
