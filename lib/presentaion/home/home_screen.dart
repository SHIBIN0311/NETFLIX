import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentaion/home/widgets/main_title_card_widget.dart';
import 'package:netflix/presentaion/home/widgets/main_title_widget.dart';
import 'package:netflix/presentaion/home/widgets/number_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              Text(direction.toString());
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 600,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(kMainImage))),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CustomButtonWidget(
                                  title: 'My List',
                                  icon: Icons.add,
                                ),
                                _playButton(),
                                const CustomButtonWidget(
                                    icon: Icons.info_outline, title: 'Info')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const MainTitleCard(
                      title: "Relesed in the past year",
                    ),
                    kHeight,
                    const MainTitleCard(
                      title: "Tranding",
                    ),
                    kHeight,
                    const NumberTitleCard(),
                    kHeight,
                    const MainTitleCard(
                      title: "Tens Dramas",
                    ),
                    kHeight,
                    const MainTitleCard(
                      title: "SouthIndian Cinema",
                    ),
                    kHeight,
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(children: [
                          Row(
                            children: [
                              Image.network(
                                'https://pngimg.com/uploads/netflix/netflix_PNG22.png',
                                width: 50,
                                height: 50,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              kWidth,
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              kWidth
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("TV Shows", style: kTextStyle),
                              Text('Movies', style: kTextStyle),
                              Text('Catogries', style: kTextStyle)
                            ],
                          )
                        ]),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      )),
    );
  }

  _playButton() {
    return Container(
      width: 120,
      height: 45,
      decoration:
          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
                size: 30,
                color: kBlack,
              ),
              label: const Text(
                'Play',
                style: TextStyle(
                    fontSize: 20, color: kBlack, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv show In India Today'),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => NumberCard(
                        index: index,
                      ))),
        )
      ],
    );
  }
}
