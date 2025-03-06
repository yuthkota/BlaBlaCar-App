import '../../model/ride/locations.dart';
import '../location_repositoy.dart';

class MockLocationsRepository extends LocationsRepository {
  @override
  List<Location> getLocations() {
    return [
      Location(name: "Phnom Penh", country: Country.cambodia),
      Location(name: "Siem Reap", country: Country.cambodia),
      Location(name: "Battambang", country: Country.cambodia),
      Location(name: "Sihanoukville", country: Country.cambodia),
      Location(name: "Kampot", country: Country.cambodia),
    ];
  }
}
