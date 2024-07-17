class Favorite {


  String id;
  String userId;
  List<String> movieIds;

  Favorite({required this.id, required this.userId, required this.movieIds});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      userId: json['userId'],
      movieIds: List<String>.from(json['movieIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'movieIds': movieIds,
    };
  }

  @override
  String toString() {
    return 'Favorite{id: $id, userId: $userId, movieIds: $movieIds}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Favorite &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          movieIds == other.movieIds;

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ movieIds.hashCode;

  
}