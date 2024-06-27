import 'package:mongo_dart/mongo_dart.dart';

class Category {
    ObjectId? _id;
    String? id;
    String? name;
    String? slug;

    Category({this.id, this.name, this.slug}); 

    Category.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        slug = json['slug'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        data['slug'] = slug;
        return data;
    }

   
}