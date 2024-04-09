import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  final String title;
  const SearchTitle({
    super.key, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }
}
