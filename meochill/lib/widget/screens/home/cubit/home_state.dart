// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../../common/enum/load_status.dart';
import '../../../../models/movie.dart';

class HomeState {
  final List<Movie> moviestoptrend;
  final LoadStatus loadStatus;
  final List<Movie> moviesrecommand;
  final List<Movie> moviegetpremium;
  HomeState(
      {this.moviestoptrend = const [],
      this.loadStatus = LoadStatus.Loading,
      this.moviesrecommand = const [],
      this.moviegetpremium = const []});

  HomeState.init()
      : this(
            moviestoptrend: [],
            loadStatus: LoadStatus.Loading,
            moviesrecommand: [],
            moviegetpremium: []);

  HomeState copyWith(
      {List<Movie>? moviestoptrend,
      LoadStatus? loadStatus,
      List<Movie>? moviesrecommand,
      List<Movie>? moviegetpremium}) {
    return HomeState(
      moviestoptrend: moviestoptrend ?? this.moviestoptrend,
      loadStatus: loadStatus ?? this.loadStatus,
      moviesrecommand: moviesrecommand ?? this.moviesrecommand,
      moviegetpremium: moviegetpremium ?? this.moviegetpremium,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        listEquals(other.moviestoptrend, moviestoptrend) &&
        other.loadStatus == loadStatus &&
        listEquals(other.moviesrecommand, moviesrecommand) &&
        listEquals(other.moviegetpremium, moviegetpremium);
  }

  @override
  int get hashCode =>
      moviestoptrend.hashCode ^
      loadStatus.hashCode ^
      moviesrecommand.hashCode ^
      moviegetpremium.hashCode;

  @override
  String toString() =>
      'HomeState(moviestoptrend: $moviestoptrend, loadStatus: $loadStatus, moviesrecommand: $moviesrecommand, moviegetpremium: $moviegetpremium)';
}
