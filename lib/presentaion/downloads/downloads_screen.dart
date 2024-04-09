


import 'dart:math';

import 'package:flutter/material.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/widgets/api.dart';
import 'package:netflix/presentaion/widgets/app_bar.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  void initState() {
    super.initState();
    fetchMovieImages();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: movieImagesNotifier,
      builder: (context, movieImages, _) {
        return SafeArea(
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: 'Downloads',
              ),
            ),
            body: ListView.separated(
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SmartDownloads();
                } else if (index == 1) {
                  return Section2(movieImages: movieImages);
                } else {
                  return const Section3();
                }
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 25,
              ),
              itemCount: 3,
            ),
          ),
        );
      },
    );
  }
}

class Section2 extends StatelessWidget {
  final List<String> movieImages;

  const Section2({super.key, required this.movieImages});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 23.5, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We\'ll download a personalised selection of movies and shows for you, so there\'s always something to watch on your device',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: kGrey),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.4,
                  backgroundColor: kGrey.withOpacity(0.5),
                ),
              ),
              DownloadsImageWidget(
                imageList: movieImages[0],
                margin: const EdgeInsets.only(left: 180.0, top: 40),
                angle: 15,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: movieImages[2],
                margin: const EdgeInsets.only(right: 180.0, top: 40),
                angle: -15,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: movieImages[3],
                margin: const EdgeInsets.only(top: 8.0),
                size: Size(size.width * 0.45, size.width * 0.65),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Set up',
              style: TextStyle(
                color: kWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MaterialButton(
            color: kWhite,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'See what you can download',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text('Smart downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;

  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imageList),
              fit: BoxFit.cover,
            ),
            color: kBlack,
          ),
        ),
      ),
    );
  }
}

