import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: kWhite,
          size: 30,
        ),
        kWidth,
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
          fit: BoxFit.cover,
          width: 28,
          height: 28,
        ),
        kWidth
      ],
    );
  }
}
