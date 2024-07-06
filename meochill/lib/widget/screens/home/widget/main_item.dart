import 'package:flutter/material.dart';

import '../../../../models/movie.dart';
import '../../details/details_screen.dart';

class MainItem extends StatelessWidget {
  const MainItem({
    super.key,
    required this.nowShowingMovies,
  });

  final List<Movie> nowShowingMovies;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: nowShowingMovies.length,
      itemBuilder: (context, index) {
        
        final movie = nowShowingMovies[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => MovieDetailScreen(movie: movie,) 
                         ));
          },
          child: 
        Container(
          width: 150,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    movie.thumburl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    
                  ),
                ),
              ),
              Padding(
                padding:  const EdgeInsets.all(2.0),
                child: Text(
                  movie.name!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                ),
                
              ),
            ],
          ),
          
        ));
      },
    );
      
    
  }
}