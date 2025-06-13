import 'package:darzi_nearby/darzi_nearby.dart';

class AdminDarziTile extends StatelessWidget {
  const AdminDarziTile(
    this.data, {
    super.key,
    required this.onEditTap,
    required this.onRemoveTap,
  });
  final DarziInfo data;
  final Function(DarziInfo data) onEditTap;
  final Function(DarziInfo data) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return BasicDarziTile(data, onTap: () {
      MyApp.routes.darziProfile.toNamed(data);
    },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => onEditTap(data),
              padding: const EdgeInsets.all(3),
              constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
              icon: const Icon(
                Icons.edit,
                color: ColorConfig.blue,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () => onRemoveTap(data),
              style: IconButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              padding: const EdgeInsets.all(3),
              constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
              icon: const Icon(
                Icons.remove,
                size: 15,
                color: Colors.white,
              ),
            ),

            // Icon(Icons.remove)
          ],
        ));
  }
}
