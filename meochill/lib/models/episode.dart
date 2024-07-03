import 'package:mongo_dart/mongo_dart.dart';

class Episode {
   ObjectId? movieid;
    List<DetailsData>? serverdata;

    Episode({this.serverdata, this.movieid}); 

    Episode.fromJson(Map<String, dynamic> json) {
      movieid = json['movie_id'];
        if (json['server_data'] != null) {
         serverdata = <DetailsData>[];
         json['server_data'].forEach((v) {
         serverdata!.add(DetailsData.fromJson(v));
        });
      }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['movie_id'] = movieid;
        data['server_data'] =serverdata != null ? serverdata!.map((v) => v?.toJson()).toList() : null;
        return data;
    }
}
class DetailsData{
  String? practice;
  String? slug;
  String? filename;
  String? link_embed;
  String? link_m3u8;

  DetailsData({this.practice, this.slug, this.filename, this.link_embed, this.link_m3u8});
  DetailsData.fromJson(Map<String, dynamic> json) {
    practice = json['practice'];
    slug = json['slug'];
    filename = json['filename'];
    link_embed = json['link_embed'];
    link_m3u8 = json['link_m3u8'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['practice'] = practice;
    data['slug'] = slug;
    data['filename'] = filename;
    data['link_embed'] = link_embed;
    data['link_m3u8'] = link_m3u8;
    return data;
  }
}