import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });
  final void Function()? onTap;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 35,
            ),
            const SizedBox(width: 16),
            Text(text),
          ],
        ),
      ),
    );
  }
}
