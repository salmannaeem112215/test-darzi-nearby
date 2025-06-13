import 'package:darzi_nearby/commons/commons.dart';

class DarziProfilePic extends StatelessWidget {
  const DarziProfilePic(
      {super.key, required this.url, this.addContraints = true});
  final ImageUrl url;
  final bool addContraints;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addContraints ? () => MyView.showDarziPic(url) : null,
      child: Container(
        constraints: addContraints
            ? const BoxConstraints(
                maxWidth: 200,
                maxHeight: 200,
                minHeight: 130,
                minWidth: 130,
              )
            : null,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
            color: Colors.white),
        child: AvatarConfig.isAvatar(url.value)
            ? Image.asset(
                url.value,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.person,
                  size: 80,
                ),
              )
            : CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: url.value,
                errorWidget: (context, url, error) => const Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
      ),
    );
  }
}
