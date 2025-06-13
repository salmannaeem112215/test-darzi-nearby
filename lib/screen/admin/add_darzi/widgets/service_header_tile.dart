import 'package:darzi_nearby/darzi_nearby.dart';

class ServiceFormHeaderTile extends StatelessWidget {
  const ServiceFormHeaderTile._(
      {super.key,
      required this.title,
      required this.onTap,
      required this.onTileTap,
      required this.icon});
  ServiceFormHeaderTile.add(
    int count,
    this.onTap, {
    this.onTileTap,
    super.key,
  })  : title = 'Service ${count + 1}',
        icon = Icon(Icons.add);
  ServiceFormHeaderTile.remove(
    int count,
    this.onTap, {
    required this.onTileTap,
    super.key,
  })  : title = 'Service ${count + 1}',
        icon = Icon(Icons.remove);
  final void Function() onTap;
  final void Function()? onTileTap;

  final Icon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTileTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              onPressed: onTap,
              icon: icon,
            ),
          ],
        ),
      ),
    );
  }
}
