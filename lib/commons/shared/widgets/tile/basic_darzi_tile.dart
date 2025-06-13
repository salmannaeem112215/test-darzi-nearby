import 'package:darzi_nearby/commons/commons.dart';

class BasicDarziTile extends StatelessWidget {
  const BasicDarziTile(this.data,
      {super.key, required this.onTap, required this.trailing});
  final DarziInfo data;
  final Widget? trailing;
  DarziInfo get darziInfo => data;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 2,
            ),
            onTap: onTap,
            leading: SmallDarziPic(url: darziInfo.userImgUrl),
            title: Text(
              darziInfo.fullname.value,
              style: MyTextStyles.r15SemiBold,
            ),
            subtitle: Text(
              darziInfo.address.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MyTextStyles.r12Light,
            ),
            trailing: trailing),
        const Divider(height: 0),
      ],
    );
  }
}
