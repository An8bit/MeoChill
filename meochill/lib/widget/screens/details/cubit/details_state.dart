part of 'details_cubit.dart';

 class DetailsState {
   final List<String> NameCategory;
   final List<Movie> movies;
   final LoadStatus loadStatus;
   final List<Episode> episodes;
    final bool isFavorite;
    DetailsState({
      required this.NameCategory,
      required this.movies,
      required this.loadStatus,
      required this.episodes,
      required this.isFavorite,

    });
    DetailsState.init({
      this.NameCategory=const [],
      this.loadStatus=LoadStatus.Init,
      this.movies= const [],
      this.episodes=const [],
      this.isFavorite=false,
    });
   DetailsState copyWith({
     List<Movie>? movies,
     LoadStatus? loadStatus,  List<Episode>? episodes, List<String>? NameCategory,bool? isFavorite,
   }) {
     return DetailsState(
       movies: movies ?? this.movies,
       loadStatus: loadStatus ?? this.loadStatus, episodes: episodes?? this.episodes, NameCategory: NameCategory?? this.NameCategory,isFavorite: isFavorite?? this.isFavorite,
     );
   }
   @override
    bool operator ==(covariant DetailsState other) {
      if (identical(this, other)) return true;
      return 
        listEquals(other.movies, movies) &&
        listEquals(other.NameCategory, NameCategory) &&
        listEquals(other.episodes, episodes) &&
        other.loadStatus == loadStatus && 
        other.isFavorite == isFavorite;
    }
    @override
    int get hashCode => movies.hashCode ^ loadStatus.hashCode^episodes.hashCode^NameCategory.hashCode^isFavorite.hashCode;
    @override
    String toString() => 'DetailsState(movies: $movies, loadStatus: $loadStatus,episodes: $episodes,NameCategory: $NameCategory,isFavorite: $isFavorite)';
    Map<String, dynamic> toMap() {
      return <String, dynamic>{
        'movies': movies,
        'loadStatus': loadStatus,
        'episodes':episodes,
        'NameCategory':NameCategory,
        'isFavorite':isFavorite,
      };
    }
    factory DetailsState.fromMap(Map<String, dynamic> map) {
      return DetailsState(
        movies: List<Movie>.from((map['movies'] as List<Movie>),),
        loadStatus: map['loadStatus'] as LoadStatus, episodes: List<Episode>.from((map['episodes'] as List<Episode>),), NameCategory: List<String>.from((map['NameCategory'] as List<String>),), isFavorite: map['isFavorite'] as bool,
      );
    }
    String toJson() => json.encode(toMap());
    
}
