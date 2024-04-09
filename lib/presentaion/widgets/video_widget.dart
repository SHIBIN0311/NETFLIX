import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
              newAndHotImages,
            ),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: kBlack.withOpacity(0.5),
            child: IconButton(
              icon: const Icon(Icons.volume_off),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
