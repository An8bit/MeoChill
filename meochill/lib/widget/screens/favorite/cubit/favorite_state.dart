part of 'favorite_cubit.dart';

 class FavoriteState  {
  final List<Movie> movies;
  final bool resultsFilm;
  final LoadStatus loadStatus;

  FavoriteState({required this.movies, required this.resultsFilm, required this.loadStatus});

  FavoriteState copyWith({List<Movie>? movies, bool? resultsFilm, LoadStatus? loadStatus}) {
    return FavoriteState(
      movies: movies ?? this.movies,
      resultsFilm: resultsFilm ?? this.resultsFilm,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  static FavoriteState init() {
    return FavoriteState(
      movies: [],
      resultsFilm: false,
      loadStatus: LoadStatus.Init,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FavoriteState &&
      listEquals(other.movies, movies) &&
      other.resultsFilm == resultsFilm &&
      other.loadStatus == loadStatus;
  }

  @override
  int get hashCode => movies.hashCode ^ resultsFilm.hashCode ^ loadStatus.hashCode;

  @override
  String toString() => 'FavoriteState(movies: $movies, resultsFilm: $resultsFilm, loadStatus: $loadStatus)';

}