import 'package:darzi_nearby/models/models.dart';

class DarziInfoWithDistance {
  DarziInfoWithDistance(this.darziInfo, this.distance);
  factory DarziInfoWithDistance.byCordinates(
      DarziInfo darziInfo, Cordinates cordinates) {
    final distance = darziInfo.cordinates.distance(cordinates);
    return DarziInfoWithDistance(darziInfo, distance);
  }
  final DarziInfo darziInfo;
  final double distance;
  bool get isValidDistance => distance >= 0;
}
