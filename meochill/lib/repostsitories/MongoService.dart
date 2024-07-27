import 'dart:math';

import 'package:meochill/models/episode.dart';
import 'package:meochill/models/account.dart';
import 'package:meochill/models/favorite.dart';
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
  Future<bool> checkLogin(Account login) async {
    var user_colection = await db.collection(USER_COLLECTION);
    var u = await user_colection
        .findOne(where.eq("email", login.email).eq("password", login.password));

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
    List<Map<String, dynamic>> movies =
        await collectionMovies.find(where.eq("category_ids", id)).toList();
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
    List<Map<String, dynamic>> ListMovieDateYear =
        await collectionMovies.find(where.eq("year", year)).toList();
    return ListMovieDateYear.map((json) => Movie.fromJson(json)).toList();
  }

  @override
  Future<List<String>> getNameCategory(List<String> idcategory) async {
    var collectionCategory = db.collection(CATEGORY_COLLECTION);
    List<Map<String, dynamic>> list =
        await collectionCategory.find(where.oneFrom("id", idcategory)).toList();
    List<String> categoryNames =
        list.map((json) => json["name"].toString()).toList();
    return categoryNames;
  }

  @override
  Future<List<Episode>> getEpisode(ObjectId id) async {
    var collectionEpisode = await db.collection(EPISODES_COLLECTION);
    List<Map<String, dynamic>> list =
        await collectionEpisode.find(where.eq("movie_id", id)).toList();
    List<Episode> episode = list.map((json) => Episode.fromJson(json)).toList();
    return episode;
  }

  @override
  Future<List<Account>> getListAccountByUserName(String email) async {
    var collectionAccount = await db.collection(USER_COLLECTION);
    List<Map<String, dynamic>> list =
        await collectionAccount.find(where.eq("email", email)).toList();
    List<Account> accounts =
        list.map((json) => Account.fromJson(json)).toList();
    print(accounts.first.email);
    return accounts;
  }

  @override
  Future<bool> registerAccount(Account account) async {
    var collectionaccount = await db.collection(USER_COLLECTION);
    try {
      var existingUser = await collectionaccount.insertOne(<String, dynamic>{
        "username": account.username,
        "password": account.password,
        "email": account.email ?? "",
        "created_at": DateTime.now().toString(),
        "updated_at": DateTime.now().toString(),
        "favorite_id": null,
        "premium": false,
      });
      if (existingUser.isSuccess) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print("error: $ex");
      return false;
    }
  }

  @override
  Future<bool> checkAccount(Account account) async {
    var collectionaccount = await db.collection(USER_COLLECTION);
    var resultmail =
        await collectionaccount.find(where.eq("email", account.email)).toList();
    if (resultmail.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<List<Movie>> getListFavorite(String email) async {
    List<Account> account = await getListAccountByUserName(email);
    ObjectId userId = account.first.id!;
    String userIdString = userId.oid;

    var collectionfavorite = await db.collection(FAVORITE_COLLECTION);
    List<Map<String, dynamic>> list = await collectionfavorite
        .find(where.eq("user_id", userIdString))
        .toList();
    List<Favorite> listfavorite =
        list.map((json) => Favorite.fromJson(json)).toList();
    if (listfavorite.isEmpty) {
      throw Exception("không co danh sach phim");
    }
    List<String> listId = listfavorite.first.movieIds;
    List<ObjectId> movieIds =
        listId.map((id) => ObjectId.fromHexString(id)).toList();
    var collectionMovie = db.collection('Movies');
    List<Map<String, dynamic>> result =
        await collectionMovie.find(where.oneFrom('_id', movieIds)).toList();
    List<Movie> listmovie = result.map((json) => Movie.fromJson(json)).toList();
    return listmovie;
  }

  @override
  Future<bool> buyPremium(String email) async {
    var collectionAccount = db.collection(USER_COLLECTION);
    var result = await collectionAccount.update(
      where.eq("email", email),
      modify.set("premium", true),
    );
    if (result.isSuccess) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<Movie>> getPremiumMovie() async {
    var collectionMovies = await db.collection(MOVIES_COLLECTION);
    List<Map<String, dynamic>> listmovies = [];
    listmovies =
        await collectionMovies.find(where.eq('sub_docquyen', true)).toList();
    return listmovies.map((json) => Movie.fromJson(json)).toList();
  }

  @override
  Future<bool> addFavorite(String email, String id) async {
    var collectionAccount = db.collection(USER_COLLECTION);
    var collectionFavorite = db.collection(FAVORITE_COLLECTION);
    List<Account> account = await getListAccountByUserName(email);
    ObjectId userId = account.first.id!;
    String userIdString = userId.oid;
    var result =
        await collectionFavorite.findOne(where.eq("user_id", userIdString));
    if (result == null) {
      var favorite = await collectionFavorite.insertOne(<String, dynamic>{
        "user_id": userIdString,
        "movieIds": [id],
      });
      if (favorite.isSuccess) {
        return true;
      } else {
        return false;
      }
    } else {
      List<dynamic> movieIds = result["movieIds"];
      movieIds.add(id);
      var update = await collectionFavorite.update(
          where.eq("user_id", userIdString), modify.set("movieIds", movieIds));
      if (update["ok"] == 0) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Future<bool> deleteFavorite(String email, String id) async {
    var collectionFavorite = db.collection(FAVORITE_COLLECTION);
    List<Account> account = await getListAccountByUserName(email);
    ObjectId userId = account.first.id!;
    String userIdString = userId.oid;
    var result =
        await collectionFavorite.findOne(where.eq("user_id", userIdString));
    if (result != null) {
      List<dynamic> movieIds = result["movieIds"];
      movieIds.remove(id);
      var delete = await collectionFavorite.update(
          where.eq("user_id", userIdString), modify.set("movieIds", movieIds));
      if (delete["ok"] == 0) {
        return true;
      } else {
        return false;
      }
    }else{
      return false;
    }
  }
  
  @override
  Future<bool> checkFavorite(String email, String id) async {
   List<Movie> listFavorite = await getListFavorite(email);
   
    if(listFavorite.any((movie) => movie.id?.oid ==id)){
      return true;
}
else{
  return false;
}
  }
}