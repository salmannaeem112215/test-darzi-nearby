import 'package:darzi_nearby/darzi_nearby.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile(
    this.info, {
    super.key,
  });
  final ServiceInfo info;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      leading: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          height: 50,
          width: 50,
          imageUrl: info.serviceImgUrl.value,
        ),
      ),
      title: Text(
        info.serviceName.value,
        style: MyTextStyles.r15,
      ),
    );
  }
}
