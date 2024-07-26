import 'package:mongo_dart/mongo_dart.dart';

class Favorite {


  ObjectId id;
  String userId;
  List<String> movieIds;

  Favorite({required this.id, required this.userId, required this.movieIds});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['_id'],
      userId: json['user_id'],
      movieIds: List<String>.from(json['movieIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user_id': userId,
      'movieIds': movieIds,
    };
  }

  @override
  String toString() {
    return 'Favorite{_id: $id, user_id: $userId, movieIds: $movieIds}';
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