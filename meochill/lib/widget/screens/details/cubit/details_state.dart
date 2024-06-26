part of 'details_cubit.dart';

class DetailsState {
  final List<Movie> movie;
  final List<Episode> episode;
  final LoadStatus loadStatus;
  final List<Actor> actor;

  DetailsState({
    required this.movie,
    required this.episode,
    required this.loadStatus,
    required this.actor,
  });
  DetailsState.init({
    this.movie = const [],
    this.episode = const [],
    this.loadStatus = LoadStatus.Init,
    this.actor = const [],
  });
  DetailsState copyWith({
    List<Movie>? movie,
    List<Episode>? episode,
    LoadStatus? loadStatus,
    List<Actor>? actor,
  }) {
    return DetailsState(
      movie: movie ?? this.movie,
      episode: episode ?? this.episode,
      loadStatus: loadStatus ?? this.loadStatus,
      actor: actor ?? this.actor,
    );
  }
  @override
  bool operator ==(covariant DetailsState other) {
    if (identical(this, other)) return true;
    return listEquals(other.movie, movie) &&
        listEquals(other.episode, episode) &&
        other.loadStatus == loadStatus &&
        listEquals(other.actor, actor);
  }
  @override
  int get hashCode =>
      movie.hashCode ^ episode.hashCode ^ loadStatus.hashCode ^ actor.hashCode;
  @override
  String toString() =>
      'DetailsState(movie: $movie, episode: $episode, loadStatus: $loadStatus, actor: $actor)';
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movie': movie,
      'episode': episode,
      'loadStatus': loadStatus,
      'actor': actor,
    };
  }
  factory DetailsState.fromMap(Map<String, dynamic> map) {
    return DetailsState(
      movie: List<Movie>.from(map['movie'] as List<Movie>),
      episode: List<Episode>.from(map['episode'] as List<Episode>),
      loadStatus: map['loadStatus'] as LoadStatus,
      actor: List<Actor>.from(map['actor'] as List<Actor>),
    );
  }
}
