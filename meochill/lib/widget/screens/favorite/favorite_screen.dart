import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/widget/screens/favorite/cubit/favorite_cubit.dart';


class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: MovieList(),
    
    );  
  }
}

class Movie {
  final String title;
  final String imagePath;

  Movie({required this.title, required this.imagePath});
}

class MovieList extends StatelessWidget {
  final List<Movie> movies = [
    Movie(title: 'Venom', imagePath: 'assets/venom.jpg'),
    Movie(title: 'Spiderman', imagePath: 'assets/spiderman.jpg'),
    Movie(title: 'Kingsman', imagePath: 'assets/kingsman.jpg'),
    // Add more movies here
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 150,
              child: Image.asset(
                movie.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  // Additional movie details can be added here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}