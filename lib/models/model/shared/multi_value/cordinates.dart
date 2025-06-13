import 'dart:convert';
import 'dart:math';

import 'package:darzi_nearby/models/models.dart';

class Cordinates extends MultiValue {
  final double lat;
  final double lon;
  static final invalid = Cordinates.latLng(0, 0);
  Cordinates.latLng(dynamic lat, dynamic lon)
      : lat = _getValue(lat),
        lon = _getValue(lon);
  Cordinates.validCreate(this.lat, this.lon);
  factory Cordinates(dynamic val) {
    if (val is Cordinates) {
      return Cordinates.latLng(val.lat, val.lon);
    }
    if (val is List && val.length >= 2) {
      return Cordinates.latLng(val[0], val[1]);
    }
    return Cordinates.latLng(0, 0);
  }
  static double _getValue(dynamic val) {
    if (val is String) val = double.tryParse(val);
    if (val is int) val = val.toDouble();
    if (val is double && val > 0) return val;
    return 0.0;
  }

  bool isInOrigin(double minLat, double maxLat, double minLon, double maxLon) =>
      (minLat <= lat && lat <= maxLat) && (minLon <= lon && lon <= maxLon);
  static double _lhrMinLat = 31.25;
  static double _lhrMaxLat = 31.75;
  static double _lhrMinLon = 74.0166667;
  static double _lhrMaxLon = 74.65;
  bool get isInLahore =>
      isInOrigin(_lhrMinLat, _lhrMaxLat, _lhrMinLon, _lhrMaxLon);
  @override
  bool operator ==(Object other) => isIdentical<Cordinates>(
      other,
      (other) => [
            lon == other.lon,
            lat == other.lat,
          ]);

  factory Cordinates.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Cordinates.fromJson(json);
  }
  factory Cordinates.fromJson(Map<String, dynamic> json) {
    return Cordinates.latLng(
      json[CordinatesK.lat],
      json[CordinatesK.lon],
    );
  }
  factory Cordinates.fromJsonValid(Map<String, dynamic> json) {
    return Cordinates.validCreate(
      double.parse(json[CordinatesK.lat]),
      double.parse(json[CordinatesK.lon]),
    );
  }

  @override
  Map<String, dynamic> get toJson {
    return {
      CordinatesK.lat: lat,
      CordinatesK.lon: lon,
    };
  }

  Map<String, List<String>> get toStringJson => {
        CordinatesK.lat: [lat.toString()],
        CordinatesK.lon: [lon.toString()],
      };

  @override
  List<String?> get isValid => [
        lat == 0 ? 'Invalid Latititude' : null,
        lon == 0 ? 'Invalid Longitude' : null,
      ];
}

extension CordinatesDistanceCalculator on Cordinates {
  // Convert degrees to radians

  // Calculate distance in meters using Haversine formula
  double distanceTo(Cordinates other) {
    const double earthRadius = 6371000; // Radius of the Earth in meters

    double lat1 = degreesToRadians(other.lat);
    double lon1 = degreesToRadians(other.lon);
    double lat2 = degreesToRadians(lat);
    double lon2 = degreesToRadians(lon);

    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    double a =
        pow(sin(dLat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c;
    return distance;
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  // Function to calculate distance to another coordinate
  double distance(Cordinates other) {
    return distanceTo(other);
  }
}

extension CordinatesK on Cordinates {
  static const String lon = 'lon';
  static const String lat = 'lat';
}
