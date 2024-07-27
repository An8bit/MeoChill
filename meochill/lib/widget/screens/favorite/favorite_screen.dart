import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/details/details_screen.dart';
import 'package:meochill/widget/screens/favorite/cubit/favorite_cubit.dart';

import '../../../models/movie.dart';
import '../../navigator/navigartor.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoriteCubit(context.read<Api>())..showListfavorite(),
      child: MovieList(),
    );
  }
}



class MovieList extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if(state.loadStatus == LoadStatus.Loading){
            return Center(child: CircularProgressIndicator());
          }else if(state.loadStatus==LoadStatus.Error){
            return Center(child: Text("Danh sách rỗng"),);
          }
      
          return Scaffold(
            appBar: AppBar(
              title: Text('My Favorite Movies'),
            ),
            body: ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: state.movies[index]);
              },
            ),
             
          );
        },
      ),
      onRefresh: () => context.read<FavoriteCubit>().showListfavorite(),
      
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
              child: Image.network(
                movie.thumburl!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<FavoriteCubit>().removeFavorite(movie.id!);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Xem Chi Tiết'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}