import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentaion/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            'Friends',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            'This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work,life and love in 1990s Manhattan.',
            style: TextStyle(color: kGrey),
          ),
          kHeight80,
          VideoWidget(),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                icon: Icons.send,
                title: 'Share',
                textSize: 12,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
                textSize: 12,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                title: 'Play',
                textSize: 12,
              ),
              kWidth,
            ],
          )
        ],
      ),
    );
  }
}
