
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/presentaion/widgets/api.dart';

class VideoListItem extends StatefulWidget {
  final int index;

  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  @override
  void initState() {
    super.initState();
    fetchMovieImages();
  }

  Future<String> fetchMovieImage(int index) async {
    const apiKey = '8da54ac86429d4c0b1982869b4569264';
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      if (index < results.length) {
        final posterPath = results[index]['poster_path'];
        if (posterPath != null && posterPath.isNotEmpty) {
          final imageUrl =
              'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$posterPath';
          return imageUrl;
        } else {
          throw Exception('Poster path is null or empty');
        }
      } else {
        throw Exception('Movie not found at index $index');
      }
    } else {
      throw Exception('Failed to load movie images: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<String>(
              future: fetchMovieImage(widget.index),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      VideoActionsWidget(
                          icon: Icons.emoji_emotions, title: "lol"),
                      VideoActionsWidget(icon: Icons.add, title: "Add"),
                      VideoActionsWidget(icon: Icons.share, title: "share"),
                      VideoActionsWidget(icon: Icons.play_arrow, title: "play"),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
