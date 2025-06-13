import 'package:darzi_nearby/darzi_nearby.dart';

class UserSearchDarzi {
  // static final List<DarziInfo> _darzi = DummyData.darzi.items;
  static final List<DarziInfo> _darzi = [];

  List<DarziInfoWithDistance> search(Cordinates cordinates) {
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
}
