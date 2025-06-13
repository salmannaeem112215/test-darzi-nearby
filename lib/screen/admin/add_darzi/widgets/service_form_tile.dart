import 'package:darzi_nearby/darzi_nearby.dart';

class ServiceFormTile extends StatelessWidget {
  const ServiceFormTile({
    super.key,
    required this.items,
    required this.count,
  });
  final DarziFormServiceEnity items;
  final int count;
  @override
  Widget build(BuildContext context) {
    final item = items.data[count];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ServiceFormHeaderTile.remove(
          count,
          () {
            items.remove(item);
          },
          onTileTap: () {
            item.nameAndPic.isHidden.value = !item.nameAndPic.isHidden.value;
          },
        ),
        Obx(() {
          final isHidden = item.nameAndPic.isHidden.value;
          if (isHidden) {
            return const SizedBox();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageUploader.service(item.nameAndPic.url),
                MyInputField(item.nameAndPic),
                MyInputField(item.description),
              ],
            );
          }
        }),
      ],
    );
  }
}
