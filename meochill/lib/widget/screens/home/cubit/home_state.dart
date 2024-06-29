part of 'home_cubit.dart';

class HomeState{
  final List<Movie> moviestoptrend;
 final LoadStatus loadStatus;
 final List<Movie> moviesrecommand;
 HomeState({
  required this.moviestoptrend,
  required this.loadStatus,
  required this.moviesrecommand
 });
 HomeState.init({
    
    this.loadStatus=LoadStatus.Init,
    this.moviestoptrend= const [],
    this.moviesrecommand=const [],
 });
  HomeState copyWith({
    List<Movie>? moviestoptrend,
    LoadStatus? loadStatus, 
    List<Movie>? moviesrecommand,
  }) {
    return HomeState(
      moviestoptrend: moviestoptrend ?? this.moviestoptrend,
      loadStatus: loadStatus ?? this.loadStatus,
      moviesrecommand : moviesrecommand ?? this.moviesrecommand,
    );
  }
  @override
  int get hashCode => moviestoptrend.hashCode ^ loadStatus.hashCode ^ moviesrecommand.hashCode;

  @override
  String toString() => 'SearchState(movies: $moviestoptrend, loadStatus: $loadStatus, moviesrecommand: $moviesrecommand';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movies': moviestoptrend,
      'loadStatus': loadStatus,
      'moviesrecommand': moviesrecommand,
      
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      moviestoptrend: List<Movie>.from((map['movies'] as List<Movie>),),
      loadStatus: map['loadStatus'] as LoadStatus, moviesrecommand: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeState.fromJson(String source) => HomeState.fromMap(json.decode(source) as Map<String, dynamic>);
}


