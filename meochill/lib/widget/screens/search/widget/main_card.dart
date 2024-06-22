import 'package:flutter/material.dart';
import 'package:meochill/widget/navigator/navigartor.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  final String id;
  const MainCard({Key? key, required this.imageUrl, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => const HomeScreen(
                     )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}