import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.

class Location {
  static Position? _position;

  static Position? get position => _position;

  static Future<bool> get isPermissionGranted async {
    final res = await Geolocator.checkPermission();
    switch (res) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return true;
      default:
        return false;
    }
  }

  static Future<bool> get getPermission async {
    if (!(await isPermissionGranted)) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.openLocationSettings();
        return false;
      }
    }
    return true;
  }

  static Future<bool> get getLocation async {
    try {
      final res = await Geolocator.getCurrentPosition();
      _position = res;
      return true;
    } catch (e) {
      print('ERROR $e');
      return false;
    }
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("SERVICE ENBLES $serviceEnabled");

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openLocationSettings();
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }

    if (!serviceEnabled) {
      try {
        return await Geolocator.getCurrentPosition();
      } catch (e) {
        throw 'Please Turn-on your location.';
      }
    }

    final res = await Geolocator.getCurrentPosition();
    _position = res;
    return res;
  }
}
