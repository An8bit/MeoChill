part of 'favorite_cubit.dart';

 class FavoriteState  {
  final LoadStatus loadStatus;
  final List<Movie> movies;
  final List<String> listIdMovie;
  
  FavoriteState({
    required this.loadStatus,
    required this.movies,
    required this.listIdMovie,
  });

  FavoriteState copyWith({
    LoadStatus? loadStatus,
    List<Movie>? movies,
    List<String>? listIdMovie,
  }) {
    return FavoriteState(
      loadStatus: loadStatus ?? this.loadStatus,
      movies: movies ?? this.movies,
      listIdMovie: listIdMovie ?? this.listIdMovie,
    );
  }

  static FavoriteState init() {
    return FavoriteState(
      loadStatus: LoadStatus.Init,
      movies: [],
      listIdMovie: [],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FavoriteState &&
      other.loadStatus == loadStatus &&
      listEquals(other.movies, movies) &&
      listEquals(other.listIdMovie, listIdMovie);
  }

  @override
  int get hashCode => loadStatus.hashCode ^ movies.hashCode ^ listIdMovie.hashCode;

  @override
  String toString() => 'FavoriteState(loadStatus: $loadStatus, movies: $movies, listIdMovie: $listIdMovie)';



}