import 'package:mongo_dart/mongo_dart.dart';

class Actor {
  ObjectId? id;
  String? name;
  String? url_image;

  Actor({
    this.id,
    this.name,
    this.url_image,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id?.toJson(),
      'name': name,
      'url_image': url_image,
    };
  }

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['_id'] != null ? ObjectId.fromHexString(json['_id']) : null,
      name: json['name'],
      url_image: json['url_image'],
    );
  }
}