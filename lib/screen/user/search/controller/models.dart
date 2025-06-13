import 'package:darzi_nearby/darzi_nearby.dart';

extension DoubleCordinatesX on double {
  String get toKm {
    if (this <= 0) return '0 m';
    if (this < 100) {
      return '${toInt()} m';
    }
    return '${(this / 1000).toStringAsFixed(1)} km';
  }
}

class PakistanArea {
  final Cordinates cordinates;
  final String name;
  final String lowerCase;

  PakistanArea(this.cordinates, this.name) : lowerCase = name.toLowerCase();

  PakistanArea.fromJson(Map<String, dynamic> val)
      : cordinates = Cordinates.fromJsonValid(val),
        name = val['name'],
        lowerCase = val['name'].toLowerCase();

  @override
  String toString() {
    return 'PakistanArea($cordinates,$name)';
  }
}

class PakistanAreaWithDistance {
  final PakistanArea pakistanArea;
  final double distance;
  bool get isValidDistance => distance >= 0;
  String get toKm {
    if (distance <= 0) return '0 m';
    if (distance < 100) {
      return '${distance.toInt()} m';
    }
    return '${(distance / 1000).toStringAsFixed(1)} km';
  }

  PakistanAreaWithDistance(this.pakistanArea, this.distance);
  @override
  String toString() {
    return 'PakistanAreaWithDistance($pakistanArea,$distance)';
  }
}

class SearchArea {
  static late final SearchArea _self;
  String get _filePath => './assets/data/name.json';
  static final List<PakistanArea> _areas = [];
  static bool _isInit = false;
  factory SearchArea() {
    try {
      return _self;
    } catch (e) {
      _self = SearchArea._();
      return _self;
    }
  }

  SearchArea._();
  Future<void> init() async {
    if (!_isInit) {
      try {
        _isInit = true;
        ByteData fileData = await rootBundle.load(_filePath);
        String data = utf8.decode(fileData.buffer.asUint8List());
        final json = jsonDecode(data);
        final newAreas =
            (json as List).map((e) => PakistanArea.fromJson(e)).toList();
        _areas.clear();
        _areas.addAll(newAreas);
      } catch (e) {
        debugPrint("ERROR OCCUR $e");
      }
    }
  }

  List<PakistanAreaWithDistance> search(String val, Cordinates? cordinates) {
    val = val.toLowerCase();
    List<String> searchWords = val.split(' ');
    // print('hi');
    final onlyLahore =
        _areas.where((element) => element.cordinates.isInLahore).toList();
    print("ONLY LAHORE ${onlyLahore.length}");

    // Filter areas based on whether the name contains the search value
    final result = onlyLahore
        .where((area) =>
            searchWords.every((element) => area.lowerCase.contains(element)))
        .toList();
    print('ASHDASD');
    final List<PakistanAreaWithDistance> resultWithDistances =
        result.map((area) {
      final double distance =
          cordinates == null ? -1 : area.cordinates.distanceTo(cordinates);
      return PakistanAreaWithDistance(area, distance);
    }).toList();
    if (cordinates == null) {
      resultWithDistances
          .sort((a, b) => a.pakistanArea.name.compareTo(b.pakistanArea.name));
    } else {
      resultWithDistances.sort((a, b) => a.distance.compareTo(b.distance));
    }
    return resultWithDistances;
  }

  PakistanAreaWithDistance nearestArea(Cordinates coordinates) {
    final List<PakistanAreaWithDistance> searchResult = search("", coordinates);
    if (searchResult.isNotEmpty) {
      return searchResult.first;
    } else {
      // Handle case when no areas are found
      throw Exception('No areas found.');
    }
  }
}
