import 'package:flutter/material.dart';
import 'package:netflix/presentaion/downloads/downloads_screen.dart';


import 'package:netflix/presentaion/fast_laugh/fast_laugh_screen.dart';
import 'package:netflix/presentaion/home/home_screen.dart';
import 'package:netflix/presentaion/main_page/widgets/bottomnavigationbar.dart';
import 'package:netflix/presentaion/new_and_hot/new_and_hot_screen.dart';
import 'package:netflix/presentaion/search/search_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final pages = [
    const HomeScreen(),
    const NewAndHotScreen(),
    const FastLaughScreen(),
    const SearchScreen(),
    const DownloadsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
