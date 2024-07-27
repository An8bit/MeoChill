part of 'favorite_cubit.dart';

 class FavoriteState  {
  final LoadStatus loadStatus;
  final List<Movie> movies;
  final List<String> listIdMovie;
  final bool isFavorite;
  FavoriteState(this.isFavorite, {
    required this.loadStatus,
    required this.movies,
    required this.listIdMovie,
  });

  FavoriteState.init({
    this.loadStatus = LoadStatus.Init,
    this.movies = const [],
    this.listIdMovie = const [],
    this.isFavorite = false,
  });

  FavoriteState copyWith({
    LoadStatus? loadStatus,
    List<Movie>? movies,
    List<String>? listIdMovie,
    bool? isFavorite,
  }) {
    return FavoriteState(
      isFavorite ?? this.isFavorite,
      loadStatus: loadStatus ?? this.loadStatus,
      movies: movies ?? this.movies,
      listIdMovie: listIdMovie ?? this.listIdMovie,
    );
  }

  @override
  bool operator ==(covariant FavoriteState other) {
    if (identical(this, other)) return true;

    return listEquals(other.movies, movies) &&
        listEquals(other.listIdMovie, listIdMovie) &&
        other.loadStatus == loadStatus &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode =>
      movies.hashCode ^ loadStatus.hashCode ^ listIdMovie.hashCode ^ isFavorite.hashCode;



}