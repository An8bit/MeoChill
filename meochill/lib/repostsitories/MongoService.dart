<<<<<<< HEAD
import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:meochill/repostsitories/log.dart';
import 'constant.dart';

class MongoService implements Api {

  
  static var db;
  MongoService(LogApp read);
  late DbCollection collection;
  
  @override
  Future<List<Map<String, dynamic>>> getListActor() {
    // TODO: implement getListActor
=======

import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/contanst.dart';
import 'package:meochill/repostsitories/log.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoService implements Api {
  static var db;
  MongoService(LogApp read);

  @override
  Future<void> checkLogin(Loginmodel login) {
    // TODO: implement checkLogin
>>>>>>> origin/navigationthuan2
    throw UnimplementedError();
  }

  @override
<<<<<<< HEAD
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
=======
>>>>>>> origin/navigationthuan2
  Future<void> conNect() async {
    db = await Db.create(DATABASE_DATA_API);
    await db.open();
  }
<<<<<<< HEAD
=======

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
  Future<List<Movie>> getResultFilm(String query) async {
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
     List<Map<String, dynamic>>  listmovies =[];
    List<String>filelds = ['name','slug','origin_name','content'];
    for (String field in filelds){
      var searchQuery = where.match(field, query,caseInsensitive: true);
      listmovies = await  collectionMovies.find(searchQuery).toList();
      if(listmovies.isNotEmpty){
        break;
      }
    }
    
    List<Movie> movies = listmovies.map((json) => Movie.fromJson(json)).toList();
    
    if (listmovies.isNotEmpty) {
      return movies;
    } else {
      return [];
    }
  }
>>>>>>> origin/navigationthuan2
}
