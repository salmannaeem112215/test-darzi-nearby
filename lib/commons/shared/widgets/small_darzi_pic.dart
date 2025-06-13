import 'package:darzi_nearby/commons/commons.dart';

class SmallDarziPic extends StatelessWidget {
  const SmallDarziPic({super.key, required this.url});
  final ImageUrl url;
  void onTap() {
    MyView.showDarziPic(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onTap,
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        child: url.isAssets
            ? Image.asset(
                url.value,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.person,
                ),
              )
            : CachedNetworkImage(
                fit: BoxFit.cover,
                height: 50,
                width: 50,
                imageUrl: url.value,
                errorWidget: (context, url, error) => const Icon(
                  Icons.person,
                ),
              ),
      ),
    );
  }
}
