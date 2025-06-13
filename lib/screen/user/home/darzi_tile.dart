import 'package:darzi_nearby/darzi_nearby.dart';

class DarziTile extends StatelessWidget {
  const DarziTile(this.data, {super.key, required this.onTap});
  final DarziInfoWithDistance data;
  DarziInfo get darziInfo => data.darziInfo;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return BasicDarziTile(
      data.darziInfo,
      onTap: onTap,
      trailing: data.isValidDistance
          ? Text(
              data.distance.toKm,
              style: MyTextStyles.r15,
            )
          : null,
    );
  }
}
