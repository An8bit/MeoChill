import 'dart:convert';

import 'package:meochill/models/category.dart';
import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:meochill/repostsitories/log.dart';
import 'constant.dart';

class MongoService implements Api {
  static var db;
  MongoService(LogApp read);
  late DbCollection collection;

  @override
  Future<List<Map<String, dynamic>>> getListDetails() async {
    return await db.collection(CATEGORY_COLLECTION).find().toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getListEpsilon(String id) {
    // TODO: implement getListEpsilon
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getListMovie() {
    // TODO: implement getListMovie
    throw UnimplementedError();
  }

  @override
  Future<bool> checkLogin(Loginmodel login) async {
    var user_colection = await db.collection(USER_COLLECTION);
    var u = await user_colection.findOne(
        where.eq("username", login.username).eq("password", login.password));

    return u != null;
  }

  @override
  Future<List<Map<String, dynamic>>> getMoviesResult() {
    // TODO: implement getMoviesResult
    throw UnimplementedError();
  }

  @override
  Future<void> conNect() async {
    db = await Db.create(DATABASE_DATA_API);
    await db.open();
  }

  @override
  Future<List<Movie>> getResultFilm(String query) async {
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
    List<Map<String, dynamic>> listmovies = [];
    List<String> filelds = ['name', 'slug', 'origin_name', 'content'];
    for (String field in filelds) {
      var searchQuery = where.match(field, query, caseInsensitive: true);
      listmovies = await collectionMovies.find(searchQuery).toList();
      if (listmovies.isNotEmpty) {
        break;
      }
    }

    List<Movie> movies =
        listmovies.map((json) => Movie.fromJson(json)).toList();

    if (listmovies.isNotEmpty) {
      return movies;
    } else {
      return [];
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getListActor() {
    // TODO: implement getListActor
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopTrending() async {
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
    //truy van lon hon 5000 view
    List<Map<String, dynamic>> list =
        await collectionMovies.find(where.gte('view', 4999)).toList();
    List<Movie> movies = list.map((json) => Movie.fromJson(json)).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getTypeMovie(String type) async {
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
    List<Map<String, dynamic>> listmovies = [];
    listmovies = await collectionMovies.find(where.eq('type', type)).toList();
    if (listmovies.isEmpty) {
      return [];
    } else {
      List<Movie> movies =
          listmovies.map((json) => Movie.fromJson(json)).toList();
      return movies;
    }
  }

  @override
  Future<List<Movie>> getMovieByCategoryId(String category) async {
    var collectionMovies = db.collection(MOVIES_COLLECTION);
    String id = await getCategoryId(category);
    List<Map<String, dynamic>> movies = await collectionMovies
        .find(where.eq("category_ids", id))
        .toList();
    List<Movie> movie = movies.map((json) => Movie.fromJson(json)).toList();
    return movie;
  }

  @override
  Future<String> getCategoryId(String category) async {
    var collectionCategory = db.collection(CATEGORY_COLLECTION);
    var categoryData =
        await collectionCategory.findOne(where.eq("name", category));
    if (categoryData != null) {
      return categoryData["id"].toString();
    } else {
      return "";
    }
  }
  
  @override
  Future<List<Movie>> getRecommandMovie() async {
     var collectionMovies = await db.collection(MOVIES_COLLECTION);
     int year = DateTime.now().year;  
    List<Map<String,dynamic>> ListMovieDateYear = await collectionMovies.find(where.eq("year",year)).toList();
    return ListMovieDateYear.map((json)=> Movie.fromJson(json)).toList();  
    
  }
}
