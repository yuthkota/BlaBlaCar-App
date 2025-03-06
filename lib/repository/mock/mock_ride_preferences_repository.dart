import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_preferences_repository.dart';

import '../../dummy_data/dummy_data.dart';

class MockRidePreferencesRepository extends RidePreferencesRepository {
  // List to hold past preferences for mock testing
  final List<RidePreference> _pastPreferences = List.from(fakeRidePrefs); // Avoid mutating the original data
  
  @override
  List<RidePreference> getPastPreferences() {
    // Return a copy of the list to avoid external mutation
    return List.unmodifiable(_pastPreferences); // Unmodifiable to prevent accidental modifications
  }

  @override
  void addPreference(RidePreference preference) {
    // Add a preference to the mock list
    _pastPreferences.add(preference);
  }
}
