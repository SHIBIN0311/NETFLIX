import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
final ValueNotifier<List<String>> movieImagesNotifier = ValueNotifier([]);

Future<void> fetchMovieImages() async {
  const apiKey = '8da54ac86429d4c0b1982869b4569264';
  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey',
    ),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> results = data['results'];
    final List<String> images = results
        .map<String>((result) =>
            'https://image.tmdb.org/t/p/w500/${result['poster_path']}')
        .toList();
    movieImagesNotifier.value = images;
  } else {
    throw Exception('Failed to load movies');
  }
}

