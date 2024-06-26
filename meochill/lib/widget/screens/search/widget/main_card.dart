import 'package:flutter/material.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/widget/navigator/navigartor.dart';
import 'package:meochill/widget/screens/details/details_screen.dart';

class MainCard extends StatelessWidget {
  
  final String imageUrl;
  final String id;
  final Movie movie;
  const MainCard({Key? key, required this.imageUrl, required this.id,required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => MovieDetailScreen() 
                     ));
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