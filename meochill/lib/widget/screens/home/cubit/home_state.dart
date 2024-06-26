part of 'home_cubit.dart';

 class HomeState {
 final LoadStatus loadStatus;
final List<Movie> movies;
HomeState({
  required this.loadStatus,
  required this.movies,
});
HomeState.init({
  this.loadStatus = LoadStatus.Init,
  this.movies = const [],
});
HomeState copyWith({
  LoadStatus? loadStatus,
  List<Movie>? movies,
}) {
  return HomeState(
    loadStatus: loadStatus ?? this.loadStatus,
    movies: movies ?? this.movies,
  );

}
@override
bool operator ==(covariant HomeState other) {
  if (identical(this, other)) return true;
  return listEquals(other.movies, movies) &&
      other.loadStatus == loadStatus;


}
@override
int get hashCode => movies.hashCode ^ loadStatus.hashCode;
@override
String toString() => 'HomeState(movies: $movies, loadStatus: $loadStatus)';
Map<String, dynamic> toMap() {
  return <String, dynamic>{
    'movies': movies,
    'loadStatus': loadStatus,
  };

}
factory HomeState.fromMap(Map<String, dynamic> map) {
  return HomeState(
    movies: List<Movie>.from(map['movies'] as List<Movie>),
    loadStatus: map['loadStatus'] as LoadStatus,
  );
 
 }
 }

