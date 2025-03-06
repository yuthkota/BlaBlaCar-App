import 'package:week_3_blabla_project/service/rides_service.dart';
import '../ride/locations.dart';

///
/// This model describes a ride preference.
/// A ride preference consists of the selection of a departure + arrival + a date and a number of passengers.
///
class RidePreference {
  final Location departure;
  final DateTime departureDate;
  final Location arrival;
  final int requestedSeats;
  final RidesFilter? ridesFilter;

  const RidePreference({
    required this.departure,
    required this.departureDate,
    required this.arrival,
    required this.requestedSeats,
    this.ridesFilter,
  });

  @override
  String toString() {
    return 'RidePref(departure: ${departure.name}, '
        'departureDate: ${departureDate.toIso8601String()}, '
        'arrival: ${arrival.name}, '
        'requestedSeats: $requestedSeats, '
        'ridesFilter: $ridesFilter)';
  }
}
