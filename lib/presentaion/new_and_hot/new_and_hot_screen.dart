import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentaion/new_and_hot/widgets/everyones_watching_widget.dart';


class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  color: kWhite, fontWeight: FontWeight.bold, fontSize: 30),
            ),
            actions: const [
              Icon(
                Icons.cast,
                color: kWhite,
                size: 30,
              ),
              kWidth,
              Icon(
                Icons.account_box_outlined,
                color: kWhite,
                size: 30,
              ),
            ],
            bottom: TabBar(
              labelColor: kBlack,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              dividerColor: kBlack,
              unselectedLabelColor: kWhite,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.all(14),
              indicator: BoxDecoration(
                color: kWhite,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Text(
                  '🍟 Coming Soon',
                ),
                Text(
                  '👀 Everyone\'s watching',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _buildComingSoon(),
              _buildEeryonesWatching(),
            ],
          )),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEeryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
    );
  }
}


