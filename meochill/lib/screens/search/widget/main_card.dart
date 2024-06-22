import 'package:flutter/material.dart';
import 'package:meochill/screens/home/home2_screen.dart';
import 'package:meochill/screens/splash/splash.dart';

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
                builder: (ctx) => const HomeScreen2(
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