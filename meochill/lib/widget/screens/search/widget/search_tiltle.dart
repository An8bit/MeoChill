import 'package:flutter/material.dart';

class SearchTiltleText extends StatelessWidget {
  const SearchTiltleText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
      );
  }
}