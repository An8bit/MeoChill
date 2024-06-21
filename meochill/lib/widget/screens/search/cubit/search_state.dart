// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/movie.dart';

class SearchState {
 final List<Movie> movies;
  
 final LoadStatus loadStatus;

SearchState({
  required this.movies,
  required this.loadStatus,
});
  
   SearchState.init({
    this.loadStatus=LoadStatus.Init,
    this.movies= const [],
  });

  SearchState copyWith({
    List<Movie>? movies,
    LoadStatus? loadStatus,
  }) {
    return SearchState(
      movies: movies ?? this.movies,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }


  @override
  bool operator ==(covariant SearchState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.movies, movies) &&
      other.loadStatus == loadStatus;
  }

  @override
  int get hashCode => movies.hashCode ^ loadStatus.hashCode;

  @override
  String toString() => 'SearchState(movies: $movies, loadStatus: $loadStatus)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movies': this.movies,
      'loadStatus': this.loadStatus,
    };
  }

  factory SearchState.fromMap(Map<String, dynamic> map) {
    return SearchState(
      movies: List<Movie>.from((map['movies'] as List<Movie>),),
      loadStatus: map['loadStatus'] as LoadStatus,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchState.fromJson(String source) => SearchState.fromMap(json.decode(source) as Map<String, dynamic>);
}


 


