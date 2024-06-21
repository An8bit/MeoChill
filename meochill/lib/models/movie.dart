import 'package:bson/bson.dart';
import 'package:meochill/models/category.dart';
import 'package:meochill/models/country.dart';
import 'package:meochill/models/episode.dart';

class Movie {
  ObjectId? id;
  String? name;
  String? slug;
  String? originname;
  String? content;
  String? type;
  String? status;
  String? thumburl;
  String? posterurl;
  bool? iscopyright;
  bool? subdocquyen;
  bool? chieurap;
  String? trailerurl;
  String? time;
  String? episodecurrent;
  String? episodetotal;
  String? quality;
  String? lang;
  String? notify;
  String? showtimes;
  int? year;
  int? view;
  List<String?>? actor;
  List<String?>? director;
  List<Category?>? category;
  List<Country?>? country;

  Movie(
      {this.id,
      this.name,
      this.slug,
      this.originname,
      this.content,
      this.type,
      this.status,
      this.thumburl,
      this.posterurl,
      this.iscopyright,
      this.subdocquyen,
      this.chieurap,
      this.trailerurl,
      this.time,
      this.episodecurrent,
      this.episodetotal,
      this.quality,
      this.lang,
      this.notify,
      this.showtimes,
      this.year,
      this.view,
      this.actor,
      this.director,
      this.category,
      this.country});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    originname = json['origin_name'];
    content = json['content'];
    type = json['type'];
    status = json['status'];
    thumburl = json['thumb_url'];
    posterurl = json['poster_url'];
    iscopyright = json['is_copyright'];
    subdocquyen = json['sub_docquyen'];
    chieurap = json['chieurap'];
    trailerurl = json['trailer_url'];
    time = json['time'];
    episodecurrent = json['episode_current'];
    episodetotal = json['episode_total'];
    quality = json['quality'];
    lang = json['lang'];
    notify = json['notify'];
    showtimes = json['showtimes'];
    year = json['year'];
    view = json['view'];
    if (json['actor'] != null) {
      actor = <String>[];
      json['actor'].forEach((v) {
        actor!.add(v);
      });
    }
    if (json['director'] != null) {
      director = <String>[];
      json['director'].forEach((v) {
        director!.add(v);
      });
    }

    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country!.add(Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['origin_name'] = originname;
    data['content'] = content;
    data['type'] = type;
    data['status'] = status;
    data['thumb_url'] = thumburl;
    data['poster_url'] = posterurl;
    data['is_copyright'] = iscopyright;
    data['sub_docquyen'] = subdocquyen;
    data['chieurap'] = chieurap;
    data['trailer_url'] = trailerurl;
    data['time'] = time;
    data['episode_current'] = episodecurrent;
    data['episode_total'] = episodetotal;
    data['quality'] = quality;
    data['lang'] = lang;
    data['notify'] = notify;
    data['showtimes'] = showtimes;
    data['year'] = year;
    data['view'] = view;
    data['actor'] =
        actor ;
    data['director'] =
        director ;
    data['category'] =
        category != null ? category!.map((v) => v?.toJson()).toList() : null;
    data['country'] =
        country != null ? country!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class Root {
  bool? status;
  String? msg;
  Movie? movie;
  List<Episode?>? episodes;

  Root({this.status, this.msg, this.movie, this.episodes});

  Root.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    movie = json['movie'] != null ? Movie?.fromJson(json['movie']) : null;
    if (json['episodes'] != null) {
      episodes = <Episode>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episode.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    data['movie'] = movie!.toJson();
    data['episodes'] =
        episodes != null ? episodes!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
  
}
