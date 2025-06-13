import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/models/dummy.dart';

class AdminSearchDarzi {
  static final List<DarziInfo> _darzi = DummyData.darzi.items;

  List<DarziInfoWithDistance> searchDarziByCordinates(Cordinates cordinates) {
    final items = <DarziInfoWithDistance>[];
    for (var d in _darzi) {
      final da = DarziInfoWithDistance.byCordinates(d, cordinates);
      if (da.distance <= 2500) {
        items.add(da);
      }
    }

    // sort the result by distance
    items.sort((a, b) => a.distance.compareTo(b.distance));

    return items;
  }

  List<DarziInfo> searchDarziByName(String name) {
    name = name.toLowerCase();
    final items = <DarziInfo>[];
    for (var d in _darzi) {
      if (d.fullname.value.toLowerCase().contains(name)) {
        items.add(d);
      }
    }
    items.sort((a, b) => a.fullname.value.compareTo(b.fullname.value));

    return items;
  }
}
