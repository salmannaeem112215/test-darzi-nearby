import 'package:darzi_nearby/commons/commons.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: ColorConfig.grayLight,
      child: Text(
        title,
        style: MyTextStyles.r16BoldBlue,
      ),
    );
  }
}
