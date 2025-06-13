import 'package:darzi_nearby/commons/commons.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile(
    this.info, {
    super.key,
  });
  final ServiceInfo info;
  static const serviceImgSize = 50.0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      leading: SizedBox(
        height: serviceImgSize,
        width: serviceImgSize,
        child: ServicePic(
          url: info.serviceImgUrl,
          size: serviceImgSize,
        ),
      ),
      title: Text(
        info.serviceName.value,
        style: MyTextStyles.r15Bold,
      ),
      subtitle: Text(
        info.description.value,
        maxLines: 5,
        style: MyTextStyles.r15,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ServicePic extends StatelessWidget {
  const ServicePic({
    super.key,
    required this.url,
    this.size,
  });

  final ImageUrl url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyView.showDialog(ServicePic(url: url));
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: CachedNetworkImage(
          fit: size != null ? BoxFit.cover : BoxFit.contain,
          height: size,
          width: size,
          imageUrl: url.value,
          errorWidget: (context, url, error) => const Icon(
            Icons.dry_cleaning_rounded,
          ),
        ),
      ),
    );
  }
}
