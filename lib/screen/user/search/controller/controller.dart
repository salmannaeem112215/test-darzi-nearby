import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:geolocator/geolocator.dart';

extension PositionX on Position {
  Cordinates get toCordinates {
    return Cordinates.latLng(
      latitude,
      longitude,
    );
  }
}

class MySearchController extends GetxController {
  final _searchAreas = SearchArea();

  RxList<PakistanAreaWithDistance> pakistanAreas =
      <PakistanAreaWithDistance>[].obs;

  void search(String val) {
    // if (Location.position == null) {
    // MyApp.routes.permission.offAllNamed();
    // } else {
    print("SEARCH CALL");
    try {
      final areas = _searchAreas.search(
        val,
        Location.position == null
            ? null
            : Cordinates.latLng(
                Location.position!.latitude,
                Location.position!.longitude,
              ),
      );
      print("SEARCH CALL ${areas.length}");
      pakistanAreas.assignAll(areas);
    } catch (e) {
      print("ERROR ON SEACH $e");
    }

    // }
  }

  void useCurrentLocation() async {
    final isGet = await Location.isPermissionGranted;
    if (!isGet) {
      MyApp.routes.permission.toNamed();
    } else {
      final isLocation = await Location.getLocation;
      if (isLocation) {
        Get.find<HomeController>().updateSearch(data: null);
        Get.back();
      }
    }

    // MyApp.routes.permission.toNamed();
  }
}
