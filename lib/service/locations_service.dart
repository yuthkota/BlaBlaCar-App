import '../model/ride/locations.dart';
import '../repository/location_repositoy.dart';

class LocationsService {
  final LocationsRepository locationsRepository;

  LocationsService(this.locationsRepository);

  List<Location> getAvailableLocations() {
    return locationsRepository.getLocations();
  }
}
