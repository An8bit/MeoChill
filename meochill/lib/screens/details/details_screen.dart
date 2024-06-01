import 'package:flutter/material.dart';
import 'package:meochill/models/Movie.dart';

class MovieDetailScreen extends StatelessWidget {
  static const String route  = "MovieDetailScreen";
  
   final Movie movie;

  MovieDetailScreen({required this.movie});

  final List<String> otherMovies = [
    "Tom Holland",
    "Zendaya",
    "Benedict Cumberbatch",
    "Jacob Batalon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieHeader(imageUrl: movie.imageUrl),
            MovieInfo(movie: movie),
            MovieDescription(description: movie.additionalInfo ?? 'No additional information available'),
            OtherMovies(otherMovies: otherMovies),
          ],
        ),
      ),
    );
  }
}

class MovieHeader extends StatelessWidget {
  final String imageUrl;

  MovieHeader({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity, height: 300),
          IconButton(
            icon: Icon(Icons.play_circle_outline, size: 60, color: Colors.white),
            onPressed: () {

              
            },
          ),
        ],
      ),
    );
  }
}

class MovieInfo extends StatelessWidget {
  final Movie movie;

  MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(movie.rating, style: TextStyle(fontSize: 18, color: Colors.grey)),
          Wrap(
            spacing: 10,
            children: [
              Chip(label: Text('Action')),
              Chip(label: Text('Adventure')),
              Chip(label: Text('Fantasy')),
            ],
          ),
          Text('Length: 2h 28min'),
          Text('Language: English'),
          Text('Rating: PG-13'),
        ],
      ),
    );
  }
}

class MovieDescription extends StatelessWidget {
  final String description;

  MovieDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class OtherMovies extends StatelessWidget {
  final List<String> otherMovies;

  OtherMovies({required this.otherMovies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cast', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10), // Add some space
          Container(
            height: 140, // Set a fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: otherMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 200, // Width for each movie container
                  child: Card(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Text(otherMovies[index], textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
