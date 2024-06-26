import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_cubit.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:meochill/common/enum/category_item.dart';
 class SortState  {
final List<Movie> movies;
 final TypeMovies typeMovies;
 final LoadStatus loadStatus;
  SortState({
    required this.typeMovies,
     required this.loadStatus,
      required this.movies,
  });
   SortState.init( {
    this.typeMovies=TypeMovies.Null,
    this.loadStatus=LoadStatus.Init,
    this.movies= const [],
  });

  SortState copyWith({
    List<Movie>? movies,
    LoadStatus? loadStatus,  TypeMovies? typeMovies,
  }) {
    return SortState(
      movies: movies ?? this.movies,
      loadStatus: loadStatus ?? this.loadStatus, typeMovies: typeMovies?? this.typeMovies,
    );
  }


  @override
  bool operator ==(covariant SortState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.movies, movies) &&
      other.loadStatus == loadStatus && 
      other.typeMovies ==typeMovies;

  }

  @override
  int get hashCode => movies.hashCode ^ loadStatus.hashCode^typeMovies.hashCode;

  @override
  String toString() => 'SearchState(movies: $movies, loadStatus: $loadStatus,typeMovies: $typeMovies)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movies': movies,
      'loadStatus': loadStatus,
      'typeMovies':typeMovies,
    };
  }

  factory SortState.fromMap(Map<String, dynamic> map) {
    return SortState(
      movies: List<Movie>.from((map['movies'] as List<Movie>),),
      loadStatus: map['loadStatus'] as LoadStatus, typeMovies: map['typeMovies'] as TypeMovies,
    );
  }

  String toJson() => json.encode(toMap());

  factory SortState.fromJson(String source) => SortState.fromMap(json.decode(source) as Map<String, dynamic>);
}


