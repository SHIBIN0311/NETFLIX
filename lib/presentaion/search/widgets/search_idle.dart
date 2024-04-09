import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/search/widgets/search_title.dart';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  SearchIdleWidgetState createState() => SearchIdleWidgetState();
}

class SearchIdleWidgetState extends State<SearchIdleWidget> {
  List<String> movieNames = [];
  List<String> movieImageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchMovieData();
  }

  Future<void> fetchMovieData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=8da54ac86429d4c0b1982869b4569264'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> movies = json.decode(response.body)['results'];
        final List<String> names =
            movies.map<String>((movie) => movie['title']).toList();
        final List<String> imageUrls = movies
            .map<String>((movie) =>
                'https://image.tmdb.org/t/p/w500/${movie['poster_path']}')
            .toList();
        setState(() {
          movieNames = names;
          movieImageUrls = imageUrls;
        });
      } else {
        throw Exception('Failed to load movie data');
      }
    } catch (error) {
      Text('Error fetching movie data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TopSearchItemTile(
              movieName:
                  movieNames.isNotEmpty ? movieNames[index] : 'Loading...',
              imageUrl: movieImageUrls.isNotEmpty ? movieImageUrls[index] : '',
            ),
            separatorBuilder: (context, index) => kHeight20,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String movieName;
  final String imageUrl;

  const TopSearchItemTile({
    super.key,
    required this.movieName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            movieName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          color: kWhite,
          size: 35,
        ),
      ],
    );
  }
}
