// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/movie.dart';

class SearchState {
 final List<Movie> movies;
 final bool resultsFilm;
 final LoadStatus loadStatus;

SearchState( {
  required this.resultsFilm,
  required this.movies,
  required this.loadStatus,
});
  
   SearchState.init( {
    this.resultsFilm=false,
    this.loadStatus=LoadStatus.Init,
    this.movies= const [],
  });

  SearchState copyWith({
    List<Movie>? movies,
    LoadStatus? loadStatus,  bool ?resultsFilm,
  }) {
    return SearchState(
      movies: movies ?? this.movies,
      loadStatus: loadStatus ?? this.loadStatus, resultsFilm: resultsFilm?? this.resultsFilm,
    );
  }


  @override
  bool operator ==(covariant SearchState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.movies, movies) &&
      other.loadStatus == loadStatus && 
      other.resultsFilm ==resultsFilm;

  }

  @override
  int get hashCode => movies.hashCode ^ loadStatus.hashCode^resultsFilm.hashCode;

  @override
  String toString() => 'SearchState(movies: $movies, loadStatus: $loadStatus,resultsFilm: $resultsFilm)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movies': movies,
      'loadStatus': loadStatus,
      'resultsFilm':resultsFilm,
    };
  }

  factory SearchState.fromMap(Map<String, dynamic> map) {
    return SearchState(
      movies: List<Movie>.from((map['movies'] as List<Movie>),),
      loadStatus: map['loadStatus'] as LoadStatus, resultsFilm: map['resultsFilm'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchState.fromJson(String source) => SearchState.fromMap(json.decode(source) as Map<String, dynamic>);
}


 


